;;; Basic python mode configuration
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
				("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

;;; iPython configuration
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;;; python style checking
(require-package 'pep8)
(require-package 'pylint)

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

(provide 'init-python-mode)
