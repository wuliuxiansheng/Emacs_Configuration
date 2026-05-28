;;; gptel configuration
(require-package 'gptel)

;; (gptel-make-ollama "Ollama"             ;Any name of your choosing
;;   :host "localhost:11434" ;Where it's running
;;   :stream t               ;Stream responses
;;   :models '("llama3:latest", "llama3:text"))          ;List of models

;; (setq
;;  gptel-model "gemma4:26b"
;;  gptel-backend (gptel-make-ollama "Ollama"
;;                  :host "localhost:11434"
;;                  :stream t
;;                  :models '(gemma4:26b qwen3.5:35b)))

(setq gptel-model "gemma-4-31b-it-8bit"
      gptel-backend (gptel-make-openai "oMLX"
                      :host "localhost:8000"
                      :protocol "http"
                      :key "6666"
                      :endpoint "/v1/chat/completions"
                      :stream t
                      :models '(gemma-4-31b-it-8bit gemma-4-31b-it-4bit)))

(setq gptel-default-mode 'org-mode)

;; Customize the buffer for gptel
;; (add-hook 'gptel-mode-hook 'turn-on-visual-line-mode)
(add-hook 'gptel-mode-hook
          (lambda ()
            (setq-local truncate-lines nil)
            (setq-local word-wrap t)
            (setq-local line-spacing 0.2)
            (flyspell-mode 1)
            (turn-on-visual-line-mode)
            ))

;; Move cursor to the next prompt
(add-hook 'gptel-post-response-functions 'gptel-end-of-response)


;; Claude Code configuration
(require-package 'vterm)
(require-package 'eat)
(eat-eshell-mode)

(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :bind ("C-c C-'" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  (claude-code-ide-emacs-tools-setup) ; Optionally enable Emacs MCP tools
  :custom
  (claude-code-ide-window-width 80)
  (claude-code-ide-terminal-backend 'vterm)
  (claude-code-ide-vterm-render-delay 0.01)
  (claude-code-ide-focus-on-open t))

;;; Custom MCP Tool Extension: ivy-bibtex PDF locator
(defun get-bibtex-pdf-path (citekey)
  "Return the absolute file path of the PDF for CITEKEY as a string.
Returns nil if no PDF is found."
  (let ((paths (bibtex-completion-find-pdf citekey)))
    (if (and paths (listp paths))
        (expand-file-name (car paths))
      (progn
        (message "No PDF found for citekey: %s" citekey)
        nil))))

(defun claude-code-ide-mcp-find-paper-path (citekey)
  "MCP Tool: Find the local PDF path for a given BibTeX citekey."
  ;; Ensure we return a string for the LLM, even on failure
  (message "MCP Tool triggered with citekey: %s" citekey)
  (let ((path (get-bibtex-pdf-path citekey)))
    (if (and path (file-exists-p path))
        ;; `(:content [(:type "text" :text ,path)])
        path
      (format "Error: No PDF found for citekey '%s'. Ensure it is in your bibtex-completion-library-path." citekey))))

;;; Custom MCP Tool Extension: org-roam-bibtex note creator
(defun claude-code-ide-mcp-create-paper-note (&optional citekey)
  "MCP Tool: Create an org-roam note for a BibTeX paper.

CITEKEY is taken from the active region; the optional argument is used
as a fallback.  The flow is:
  1. Start a capture for CITEKEY through the same code path as
     `orb-insert-link' (so the \"r\" template is preformatted with
     BibTeX fields exactly as that command produces).
  2. Finalize the resulting capture buffer to save the note and close
     the capture.
  3. Reopen the saved note in the current window."
  (require 'org-roam-bibtex)
  (require 'bibtex-completion)
  (let* ((region-key (when (use-region-p)
                       (string-trim
                        (buffer-substring-no-properties
                         (region-beginning) (region-end)))))
         (key (or (and region-key (not (string-empty-p region-key)) region-key)
                  (and citekey  (not (string-empty-p citekey))  citekey))))
    (message "MCP Tool create-paper-note triggered with citekey: %s" key)
    (cond
     ((not key)
      "Error: No citekey provided and no active region in the current buffer.")
     ((not (assoc "r" org-roam-capture-templates))
      "Error: No \"r\" template found in `org-roam-capture-templates'.")
     ((not (bibtex-completion-get-entry key))
      (format "Error: No BibTeX entry found for citekey '%s'." key))
     (t
      (condition-case err
          (let* (;; Warm bibtex-completion cache (otherwise the
                 ;; preformat step has no data to substitute).
                 (_ (bibtex-completion-candidates))
                 (_ (orb-make-notes-cache))
                 (existing (orb-note-exists-p key))
                 (note-file (and existing (org-roam-node-file existing))))
            (if existing
                ;; Note already exists — just open it.
                (progn
                  (pop-to-buffer-same-window (find-file-noselect note-file))
                  (format "Opened existing org-roam note for citekey '%s'." key))
              ;; --- 1. Capture --------------------------------------------
              (let* ((scratch (generate-new-buffer " *orb-mcp-scratch*"))
                     ;; Restrict capture to the "r" template so orb won't
                     ;; prompt for a template choice.
                     (org-roam-capture-templates
                      (list (assoc "r" org-roam-capture-templates))))
                (unwind-protect
                    (with-current-buffer scratch
                      (org-mode)
                      ;; Same code path as `orb-insert-link' after the user
                      ;; selects a candidate.  Runs in a writable buffer so
                      ;; the link-insertion finalize hook doesn't error.
                      (orb-insert-edit-note key))
                  ;; --- 2. Finalize the capture buffer --------------------
                  (let ((cap-buf (cl-find-if
                                  (lambda (b)
                                    (buffer-local-value 'org-capture-mode b))
                                  (buffer-list))))
                    (when cap-buf
                      (with-current-buffer cap-buf
                        (let ((kill-buffer-query-functions nil))
                          (org-capture-finalize)))))
                  (when (buffer-live-p scratch) (kill-buffer scratch))))
              ;; --- 3. Reopen the note ------------------------------------
              (let ((file (expand-file-name
                           (format "references/%s.org" key)
                           org-roam-directory)))
                (when (file-exists-p file)
                  (when (fboundp 'org-roam-db-update-file)
                    (org-roam-db-update-file file))
                  (pop-to-buffer-same-window (find-file-noselect file))))
              (format "Created org-roam note for citekey '%s'." key)))
        (error (format "Error creating note for citekey '%s': %s"
                       key (error-message-string err))))))))

;;; Custom MCP Tool Extension: fetch linked notes through org-roam
(defun claude-code-ide-mcp--roam-format-node (node)
  "Format an org-roam NODE as a single-line summary string."
  (format "  - %s [id:%s] (%s)"
          (org-roam-node-title node)
          (org-roam-node-id node)
          (org-roam-node-file node)))

(defun claude-code-ide-mcp-get-linked-notes (identifier)
  "MCP Tool: Return backlinks and forward links of an org-roam node.
IDENTIFIER is matched first as an org-roam node ID, then as a title or alias."
  (require 'org-roam)
  (message "MCP Tool get-linked-notes triggered with identifier: %s" identifier)
  (let ((node (or (ignore-errors (org-roam-node-from-id identifier))
                  (ignore-errors (org-roam-node-from-title-or-alias identifier)))))
    (if (not node)
        (format "Error: No org-roam node found for identifier '%s'." identifier)
      (let* ((id (org-roam-node-id node))
             (backlinks (org-roam-backlinks-get node))
             (forward-rows (org-roam-db-query
                            [:select :distinct [dest] :from links
                                     :where (= source $s1) :and (= type "id")]
                            id))
             (forward-nodes (delq nil
                                  (mapcar (lambda (row)
                                            (org-roam-node-from-id (car row)))
                                          forward-rows))))
        (format "Node: %s [id:%s]\nFile: %s\n\nBacklinks (%d):\n%s\n\nForward links (%d):\n%s"
                (org-roam-node-title node) id (org-roam-node-file node)
                (length backlinks)
                (if backlinks
                    (mapconcat (lambda (bl)
                                 (claude-code-ide-mcp--roam-format-node
                                  (org-roam-backlink-source-node bl)))
                               backlinks "\n")
                  "  (none)")
                (length forward-nodes)
                (if forward-nodes
                    (mapconcat #'claude-code-ide-mcp--roam-format-node
                               forward-nodes "\n")
                  "  (none)"))))))



(require 'claude-code-ide)

;; (setq claude-code-ide-cli-debug t)
;; (setq claude-code-ide-debug t)

(claude-code-ide-make-tool
 :function #'claude-code-ide-mcp-find-paper-path
 :name "claude-code-ide-mcp-find-paper-path"
 :description "Locate the absolute file path of a research paper PDF on the local system given its BibTeX citekey (e.g., 'Yim-polybot-icra-2000'). Use this tool whenever a BibTeX citekey is mentioned to find, read, or locate a PDF."
 :args '((:name "citekey"
                :type string
                :description "BibTeX citekey to search for")))

(claude-code-ide-make-tool
 :function #'claude-code-ide-mcp-create-paper-note
 :name "claude-code-ide-mcp-create-paper-note"
 :description "Create or visit an org-roam note for a research paper using `orb-insert-link' from org-roam-bibtex. The citekey is taken from the currently selected region in Emacs; the optional citekey argument is used as a fallback when no region is active."
 :args '((:name "citekey"
                :type string
                :description "Optional BibTeX citekey fallback if no region is selected"
                :optional t)))

(claude-code-ide-make-tool
 :function #'claude-code-ide-mcp-get-linked-notes
 :name "claude-code-ide-mcp-get-linked-notes"
 :description "Given an org-roam node identifier (node ID, or a title/alias), return its backlinks (notes linking to it) and forward links (notes it links to). Useful for exploring related notes around a topic."
 :args '((:name "identifier"
                :type string
                :description "An org-roam node ID, title, or alias")))

(provide 'init-llm)
