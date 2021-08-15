;;; LSP Configuration

(require-package 'lsp-mode)

(setq lsp-enable-links nil)

(require-package 'lsp-ui)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1))))
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
;; (setq lsp-ui-sideline-show-hover t)

;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
(setq lsp-ui-peek-enable t)
(setq lsp-ui-peek-show-directory t)

(defun company-lsp-setup ()
  "Configure company-backends for company-lsp and company-yasnippet."
  (push '(company-capf :with company-yasnippet) company-backends)
  )

(add-hook 'lsp-mode-hook 'company-lsp-setup)

(provide 'init-lsp)
;;; init-cc-mode ends here
