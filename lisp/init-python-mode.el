;;; Basic python mode configuration
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

;; (require-package 'pyvenv)
(require-package 'conda)
(conda-env-initialize-interactive-shells)
(conda-env-initialize-eshell)

;;; iPython configuration
(when *is-a-linux*
  (setq
   python-shell-interpreter "jupyter"
   python-shell-interpreter-args "console --simple-prompt"
   python-shell-prompt-detect-failure-warning nil
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
  ;; (setenv "WORKON_HOME" (concat (getenv "CONDA_PREFIX") "/envs"))
  )

(when *is-a-mac*
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "-i --simple-prompt"
   python-shell-prompt-detect-failure-warning nil
   ;; python-shell-completion-native-enable nil
   ;; python-shell-prompt-input-regexps '("In \\[[0-9]+\\]: ")
   ;; python-shell-prompt-output-regexps '("Out\\[[0-9]+\\]: ")
   ;; python-shell-completion-setup-code
   ;; "from IPython.core.completerlib import module_completion"
   ;; python-shell-completion-module-string-code
   ;; "';'.join(module_completion('''%s'''))\n"
   ;; python-shell-completion-string-code
   ;; "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
   )
  ;; (setenv "WORKON_HOME" "/opt/homebrew/Caskroom/miniconda/base/envs")
  (custom-set-variables
   '(conda-anaconda-home "/opt/homebrew/Caskroom/miniconda/base/"))
  )

(with-eval-after-load 'python
  (add-to-list 'python-shell-completion-native-disabled-interpreters "jupyter")
  ;; (pyvenv-mode 1)
  )

;;; python style checking
;; (require-package 'pep8)
;; (require-package 'pylint)

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
;; (require-package 'company-jedi)
;; (defun company-jedi-setup ()
;;   "Configure company-backends for company-jedi and company-yasnippet."
;;   (push '(company-jedi :with company-yasnippet) company-backends)
;;   ;; (add-to-list 'company-backends 'company-jedi)
;;   )
;; (add-hook 'python-mode-hook 'company-jedi-setup)

;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot t)
;; (add-hook 'python-mode-hook 'jedi:setup)

(setq jedi-custom-file (expand-file-name "jedi-custom.el" user-emacs-directory))
(when (file-exists-p jedi-custom-file)
  (load jedi-custom-file))


(require-package 'lsp-jedi)
(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-disabled-clients 'pyls)
  ;; (add-to-list 'lsp-enabled-clients 'jedi)
  )

(add-hook 'python-mode-hook #'lsp)

;; jupyter configuration
(require-package 'jupyter)
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   (append org-babel-load-languages
           '((jupyter . t))))
  (org-babel-jupyter-override-src-block "python")
  )

(provide 'init-python-mode)
