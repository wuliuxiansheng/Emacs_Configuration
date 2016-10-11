;;; Basic python mode configuration
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
				("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

;;; Configure anaconda-mode
(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (add-hook 'python-mode-hook
                (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))

;;; iPython configuration
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""  ;; required by IPython 5
 ;; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 ;; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 ;; python-shell-completion-setup-code
 ;; "from IPython.core.completerlib import module_completion"
 ;; python-shell-completion-module-string-code
 ;; "';'.join(module_completion('''%s'''))\n"
 ;; python-shell-completion-string-code
 ;; "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
 )

;;; python style checking
(require-package 'pep8)
(require-package 'pylint)

;; integrate autopep8
(require-package 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

;;; pymacs configuration
(require-package 'pymacs)

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
;; (defun company-ropemacs-setup ()
;;   (add-to-list 'company-backend 'company-ropemacs))
;; (add-hook 'python-mode-hook 'company-ropemacs-setup)

(provide 'init-python-mode)
