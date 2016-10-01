;;; C/C++ Configuration

;;; code hide
(load-library "hideshow")
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'c++-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
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

;;; CEDET Configuration
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)
;; (global-ede-mode 1)

;; remove semantic for python mode and html mode
(setq semantic-new-buffer-setup-functions
	  (remove-if (lambda (buffer-setup-function)
				   (member (car buffer-setup-function)
						   '(python-mode html-mode)))
				 semantic-new-buffer-setup-functions))

(remove-hook 'python-mode-hook 'wisent-python-default-setup)

(defvar user-include-dirs-cpp
  '("." "./inc" "../inc" "../../../../common/c/user/inc"
	"../../../../common/cpp/user/inc"
	"../../../../smores_common/c/inc" "../../../../smores_common/cpp/inc"
	"../../../../stm32/c/user/inc" "../../../../stm32/cpp/user/inc"
	"../../../../stm32f30x/c/user/inc" "../../../../stm32f30x/c/st/inc"
	"../../../../stm32f37x/c/user/inc" "../../../../stm32f37x/c/st/inc"
	))

(defvar user-include-dirs-c
  '("." "./inc" "../inc"
	"/usr/local/CrossPack-AVR-20131216/avr/include/avr"
	"/usr/local/CrossPack-AVR-20131216/avr/include"
	"/usr/local/CrossPack-AVR-20131216/avr/include/util"))

(defun semantic-setup ()
  (mapc (lambda (dir)
		  (semantic-add-system-include dir 'c++-mode))
		user-include-dirs-cpp)
  (mapc (lambda (dir)
		  (semantic-add-system-include dir 'c-mode))
		user-include-dirs-c)
  )

(add-hook 'semantic-init-hooks 'semantic-setup)

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

;; add user path for searching c/c++ header files
(eval-after-load 'company-c-headers
  '(mapcar (lambda (item) (add-to-list 'company-c-headers-path-user item))
		   user-include-dirs))


(provide 'init-cc-mode)
