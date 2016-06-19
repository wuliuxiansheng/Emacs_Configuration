(require-package 'pymacs)

;;; pymacs configuration
(eval-after-load 'python
  '(progn
	 (autoload 'pymacs-apply "pymacs")
	 (autoload 'pymacs-call "pymacs")
	 (autoload 'pymacs-eval "pymacs" nil t)
	 (autoload 'pymacs-exec "pymacs" nil t)
	 (autoload 'pymacs-load "pymacs" nil t)
	 (message "loading ropemacs")
	 (pymacs-load "ropemacs" "rope-")
	 (setq ropemacs-enable-autoimport t)))
;;; integrate ropemacs with company-mode
(defun company-ropemacs-setup ()
  (add-to-list 'company-backend 'company-ropemacs))
(add-hook 'python-mode-hook 'company-ropemacs-setup)


(provide 'init-pymacs)
