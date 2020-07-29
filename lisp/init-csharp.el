;;; c# configuration
(require-package 'omnisharp)
(add-hook 'csharp-mode-hook 'omnisharp-mode)

(eval-after-load
    'company
  '(add-to-list 'company-backends 'company-omnisharp))

(defun csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)

  (electric-pair-local-mode 1)
  )

(add-hook 'csharp-mode-hook 'csharp-mode-setup t)

(provide 'init-csharp)
