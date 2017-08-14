;;; C/C++ Configuration

;;; code hide
;; (load-library "hideshow")
;; (add-hook 'c-mode-hook 'hs-minor-mode)
;; (add-hook 'c++-mode-hook 'hs-minor-mode)
;; M-x hs-minor-mode
;; C-c @ ESC C-s show all
;; C-c @ ESC C-h hide all
;; C-c @ C-s     show block
;; C-c @ C-h     hide block
;; C-c @ C-c     toggle hide/show

;;; c and c++ style
;; declare c-default-style and c-basic-offset
(defvar c-default-style)
(defvar c-basic-offset)
;; set the style and offset
(setq c-default-style "k&r"
	  c-basic-offset 4)
;; tables instead of spaces
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)

;;(add-hook 'c-mode-common-hook ( lambda()
;;                                ( c-set-style "k&r" )
;;                                (setq c-basic-offset 4) ) )
;;(add-hook 'c++-mode-common-hook ( lambda()
;;                                  ( c-set-style "k&r" )
;;                                  (setq c-basic-offset 4) ) )
;;(setq c-mode-hook '(lambda () (auto-fill-mode 1)))
;;(setq c-indent-level 5)
;;(setq c-continued-statement-offset 5)
;;(setq c-argdecl-indent 0)
;;(setq c-brace-offset -5)
;;(setq c-label-offset -5)

;;;cc-mode configuration
;; tab indent for
;;(defun my-c-mode-hook ()
;;  (setq c-basic-offset 4
;;        indent-tabs-mode t
;;        default-tab-width 4))
;;(add-hook 'c-mode-hook 'my-c-mode-hook)
;; tab indent for c++
;;(defun my-c++-mode-hook()
;;  (setq c-basic-offset 4
;;	indent-tabs-mode t
;;	default-tab-width 4))
;;(add-hook 'c++-mode-hook 'my-c++-mode-hook)


;;; run compile command without hitting Enter
(setq compilation-read-command nil)

;;; key binding for compile
(defun cc-mode-compile-make ()
  (interactive)
  (setq compile-command "cd ../ && make")
  (call-interactively 'compile))
(defun cc-mode-compile-flash ()
  (interactive)
  (setq compile-command "cd ../ && make flash")
  (call-interactively 'compile))
(defun cc-mode-compile-clean ()
  (interactive)
  (setq compile-command "cd ../ && make clean")
  (call-interactively 'compile))
(defun cc-mode-compile ()
  (local-set-key (kbd "C-x C m") 'cc-mode-compile-make)
  (local-set-key (kbd "C-x C f") 'cc-mode-compile-flash)
  (local-set-key (kbd "C-x C c") 'cc-mode-compile-clean))

(add-hook 'c-mode-hook 'cc-mode-compile)
(add-hook 'c++-mode-hook 'cc-mode-compile)

;;; CEDET Configuration
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)
(global-ede-mode 1)

(setq ede-custom-file (expand-file-name "cc-mode-projects.el" user-emacs-directory))
(when (file-exists-p ede-custom-file)
  (load ede-custom-file))

;; remove semantic for python mode and html mode
(setq semantic-new-buffer-setup-functions
	  (remove-if (lambda (buffer-setup-function)
				   (member (car buffer-setup-function)
						   '(python-mode html-mode)))
				 semantic-new-buffer-setup-functions))

(remove-hook 'python-mode-hook 'wisent-python-default-setup)

;; set SemanticDB search throttle
(setq-mode-local c-mode
				 semanticdb-find-default-throttle
				 '(project unloaded recursive))
(setq-mode-local c++-mode
				 semanticdb-find-default-throttle
				 '(project unloaded recursive))

;; add company-semantic to company mode
(defun company-semantic-setup ()
  (add-to-list 'company-backends 'company-semantic))
(add-hook 'c++-mode-hook 'company-semantic-setup)
(add-hook 'c-mode-hook 'company-semantic-setup)

;;; c/c++ header complete
(require-package 'company-c-headers)

;; add company-c-headers to company mode
(defun company-c-headers-setup ()
  (add-to-list 'company-backends 'company-c-headers))
(add-hook 'c++-mode-hook 'company-c-headers-setup)
(add-hook 'c-mode-hook 'company-c-headers-setup)

(setq header-custom-file (expand-file-name "cc-mode-header-custom.el" user-emacs-directory))
(when (file-exists-p header-custom-file)
  (load header-custom-file))

;;; CMake configuration
(require-package 'cmake-mode)
(setq auto-mode-alist
	  (append
	   '(("CMakeLists\\.txt\\'" . cmake-mode))
	   '(("\\.cmake\\'" . cmake-mode))
	   auto-mode-alist))


(load "company-cmake")
(defun company-cmake-setup ()
  (add-to-list 'company-backends 'company-cmake))
(add-hook 'cmake-mode-hook 'company-cmake-setup)



(provide 'init-cc-mode)
;;; init-cc-mode ends here
