;;; Basic python mode configuration
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
				("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)


;;; iPython configuration
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""  ;; required by IPython 5
 ;; python-shell-completion-native-enable nil
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


;;; pymacs and ropemacs configuration
;; (require-package 'pymacs)

;; (eval-after-load 'python
;;   '(progn
;; 	 (autoload 'pymacs-apply "pymacs")
;; 	 (autoload 'pymacs-call "pymacs")
;; 	 (autoload 'pymacs-eval "pymacs" nil t)
;; 	 (autoload 'pymacs-exec "pymacs" nil t)
;; 	 (autoload 'pymacs-load "pymacs" nil t)
;; 	 (message "loading ropemacs")
;; 	 (pymacs-load "ropemacs" "rope-")
;; 	 (setq ropemacs-enable-autoimport t)))

;;; jedi configuration
(require-package 'company-jedi)
(defun company-jedi-setup ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'company-jedi-setup)

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)



(provide 'init-python-mode)
