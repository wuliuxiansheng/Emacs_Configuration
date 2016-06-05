(require-package 'company-math)

;;; company-math configuration
(eval-after-load 'tex-mode
  '(progn
	 (defun company-math-latex-mode-setup () 
	   (setq-local company-backends
				   (append '((company-math-symbols-latex company-latex-commands))
						   company-backends)))

	 (add-hook 'TeX-mode-hook 'company-math-latex-mode-setup)))

(provide 'init-company-math)
