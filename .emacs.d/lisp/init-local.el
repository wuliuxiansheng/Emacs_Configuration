;;; Personal Information
(setq user-full-name "Chao Liu")
(setq user-mail-address "chao.liu0307@gmail.com")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(package-initialize)

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
;;; integrate ropemacs with auto-complete
(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
    (lambda ()
        (add-to-list 'ac-sources 'ac-source-ropemacs)))

(provide 'init-local)
