(require-package 'company-math)

;;; company-math configuration
(defun company-math-mode-setup ()
  (setq-local company-backends
			  (append '((company-math-symbols-latex company-latex-commands))
					  company-backends)))
(add-hook 'TeX-mode-hook 'company-math-mode-setup)
(add-hook 'org-mode-hook 'company-math-mode-setup)

(setq company-math-allow-latex-symbols-in-faces t)


(provide 'init-company-math)
