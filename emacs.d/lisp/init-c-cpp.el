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
(semantic-mode 1)
(global-ede-mode 1)

(defvar user-include-dirs
  '("." "./inc" "../inc" "../../../../common/c/user/inc" "../../../../common/cpp/user/inc"
	"../../../../smores_common/c/inc" "../../../../smores_common/cpp/inc"
	"../../../../stm32/c/user/inc" "../../../../stm32/cpp/user/inc"
	"../../../../stm32f30x/c/user/inc" "../../../../stm32f30x/c/st/inc"
	"../../../../stm32f37x/c/user/inc" "../../../../stm32f37x/c/st/inc"))

(mapc (lambda (dir)
		(semantic-add-system-include dir 'c++-mode)
		(semantic-add-system-include dir 'c-mode))
	  user-include-dirs)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-semantic))

;;; c/c++ header complete
(require-package 'company-c-headers)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-c-headers))
;; add user path for searching
(eval-after-load 'company-c-headers
  '(mapcar (lambda (item) (add-to-list 'company-c-headers-path-user item))
		   user-include-dirs))


(provide 'init-c-cpp)
