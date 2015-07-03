;;; emacs + auctex on Mac

(require-package 'auctex)
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

(provide 'init-auctex)