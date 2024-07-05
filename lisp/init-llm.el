;;; gptel configuration
(require-package 'gptel)

;; (gptel-make-ollama "Ollama"             ;Any name of your choosing
;;   :host "localhost:11434" ;Where it's running
;;   :stream t               ;Stream responses
;;   :models '("llama3:latest", "llama3:text"))          ;List of models

(setq
 gptel-model "llama3:latest"
 gptel-backend (gptel-make-ollama "Ollama"
                 :host "localhost:11434"
                 :stream t
                 :models '("llama3:latest" "llama3:text")))

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

(provide 'init-llm)
