;;; Personal Information
(setq user-full-name "Chao Liu")
(setq user-mail-address "chao.liu0307@gmail.com")

;;;set the default font and size
(when *is-a-mac*
  (set-default-font "-*-Menlo-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
(when *is-a-linux*
  (set-default-font "-unkonwn-Ubuntu Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1"))

(global-linum-mode t);show line number

;;;cursor stop blinking 
(blink-cursor-mode -1)
(transient-mark-mode 1)

;;;highlight the current row
(require 'hl-line)
(global-hl-line-mode t)

;;; c and c++ style
(add-hook 'c-mode-common-hook ( lambda()
                                ( c-set-style "k&r" ) 
                                (setq c-basic-offset 4) ) ) 
(add-hook 'c++-mode-common-hook ( lambda() 
                                  ( c-set-style "k&r" ) 
                                  (setq c-basic-offset 4) ) )
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
