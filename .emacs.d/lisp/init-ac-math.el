(require-package 'ac-math)

;;; ac-math configuration
(eval-after-load 'tex-mode
  '(progn
	 (require 'ac-math)
	 (add-to-list 'ac-modes 'latex-mode)

	 (defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
	   (setq ac-sources
			 (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
					 ac-sources)))

	 (add-hook 'TeX-mode-hook 'ac-latex-mode-setup)
	 (ac-flyspell-workaround)))

(provide 'init-ac-math)
