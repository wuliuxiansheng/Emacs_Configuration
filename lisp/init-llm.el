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
  (claude-code-ide-focus-on-open nil))

(provide 'init-llm)
