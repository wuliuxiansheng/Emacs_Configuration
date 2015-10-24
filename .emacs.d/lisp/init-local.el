;;; Personal Information
(setq user-full-name "Chao Liu")
(setq user-mail-address "chao.liu0307@gmail.com")

;;;set the default font and size

(when *is-a-mac*
  (set-frame-font "-*-Menlo-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
(when *is-a-linux*
  (set-frame-font "-unkonwn-Ubuntu Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1"))

(global-linum-mode t);show line number

;;;cursor stop blinking 
(blink-cursor-mode -1)
(transient-mark-mode 1)

;;;highlight the current row
(require 'hl-line)
(global-hl-line-mode t)

;;;code hide
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

(provide 'init-local)
