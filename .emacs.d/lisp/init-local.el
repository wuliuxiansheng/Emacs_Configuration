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

;;;yasnippet
(require-package 'yasnippet)
(require 'yasnippet)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(yas-global-mode t)

;;; emacs + auctex on Mac

;;(load "auctex.el" nil t t)

(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH"))) 
(setq exec-path (append '("/usr/texbin" "/usr/local/bin") exec-path)) 

;(if (string-equal system-type "windows-nt")
;     (require 'tex-mik))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))

(add-hook 'LaTeX-mode-hook
	  (lambda()
	    (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
	    (setq TeX-command-default "XeLaTeX")))

(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
	    'LaTeX-math-mode
	    'turn-on-reftex
	    'linum-mode))
(add-hook 'LaTeX-mode-hook
          (lambda ()
           (setq TeX-auto-untabify t ; remove all tabs before saving
                  TeX-engine 'xetex ; ('xetex) | ('default)
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t) ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
	    ;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            ))
(setq TeX-view-program-list
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")("Preview" "open -a Preview.app %o")))
(setq TeX-view-program-selection
      '((output-pdf "Skim")
        (output-dvi "xdvi")))
(setq TeX-insert-quote t)
(ispell-change-dictionary "american" t)
(setq-default ispell-program-name "aspell")
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

(add-hook 'doc-view-mode-hook 'auto-revert-mode)
;end emacs + auctex


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
