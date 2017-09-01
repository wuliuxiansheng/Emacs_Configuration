;;; emacs + auctex

(require-package 'auctex)

(when *is-a-mac*

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))

  (add-hook 'LaTeX-mode-hook
			(lambda()
			  (add-to-list 'TeX-command-list '("PDFLaTeX" "%`pdflatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
			  (setq TeX-command-default "PDFLaTeX")))

  (mapc (lambda (mode)
		  (add-hook 'LaTeX-mode-hook mode))
		(list 'auto-fill-mode
			  'LaTeX-math-mode
			  'turn-on-reftex
			  'linum-mode))
  (add-hook 'LaTeX-mode-hook
			(lambda ()
			  (setq TeX-auto-untabify t ;; remove all tabs before saving
					TeX-engine 'xetex ;; ('xetex) | ('default)
					TeX-show-compilation t) ;; display compilation windows
			  (TeX-global-PDF-mode t) ;; PDF mode enable, not plain
			  (setq TeX-save-query nil)
			  (imenu-add-menubar-index)
			  ;; (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
			  ))
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-view-program-list
		'(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")("Preview" "open -a Preview.app %o")))
  (setq TeX-view-program-selection
		'((output-pdf "Skim")
		  (output-dvi "xdvi")))
  (setq TeX-insert-quote t)
  ;; (ispell-change-dictionary "american" t)
  ;; (setq-default ispell-program-name "aspell")

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  )

(when *is-a-linux*

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (setq TeX-output-view-style '(("^pdf$" "." "okular %o %(outpage)")))

  (add-hook 'LaTeX-mode-hook
			(lambda()
			  (add-to-list 'TeX-command-list '("PDFLaTeX" "%`pdflatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
			  (setq TeX-command-default "PDFLaTeX")))

  (mapc (lambda (mode)
		  (add-hook 'LaTeX-mode-hook mode))
		(list 'auto-fill-mode
			  'LaTeX-math-mode
			  'turn-on-reftex
			  'linum-mode))
  (add-hook 'LaTeX-mode-hook
			(lambda ()
			  (setq TeX-auto-untabify t ;; remove all tabs before saving
					TeX-engine 'xetex ;; ('xetex) | ('default)
					TeX-show-compilation t) ;; display compilation windows
			  (TeX-global-PDF-mode t) ;; PDF mode enable, not plain
			  (setq TeX-save-query nil)
			  (imenu-add-menubar-index)
			  ;; (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
			  ))
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method 'synctex)

  ;; Configure Evince as PDF viewer
  ;; (setq TeX-view-program-list
  ;;		'(("Evince" "evince %o")))
  ;; (setq TeX-view-program-selection
  ;;		'((output-pdf "Evince")
  ;;		  (output-dvi "xdvi")))

  ;; Configure Okular as PDF viewer for forward search and inverse search
  (add-hook 'LaTeX-mode-hook '(lambda ()
								(add-to-list 'TeX-expand-list
											 '("%u" Okular-make-url))))
  (defun Okular-make-url ()
	(concat
	 "file://"
	 (expand-file-name (funcall file (TeX-output-extension) t)
					   (file-name-directory (TeX-master-file)))
	 "#src:"
	 (TeX-current-line)
	 (expand-file-name (TeX-master-directory))
	 "./"
	 (TeX-current-file-name-master-relative)))
  (setq TeX-view-program-list '(("Okular"  ("okular --unique %u"))))
  (setq TeX-view-program-selection '((output-pdf "Okular")
									 (output-dvi "xdvi")))

  ;; (setq TeX-view-program-list
  ;;		(quote (("Okular" "okular --unique %o#src:%n%b"))))
  ;; (setq TeX-view-program-selection
  ;;		(quote ((engine-omega "dvips and gv")
  ;;				(output-dvi "xdvi")
  ;;				(output-pdf "Okular"))))

  (setq TeX-insert-quote t)
  ;; (ispell-change-dictionary "american" t)
  ;; (setq-default ispell-program-name "aspell")

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  )

(when *is-a-windows*

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))

  (add-hook 'LaTeX-mode-hook
            (lambda()
              (add-to-list 'TeX-command-list '("PDFLaTeX" "%`pdflatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "PDFLaTeX")))

  (mapc (lambda (mode)
          (add-hook 'LaTeX-mode-hook mode))
        (list 'auto-fill-mode
              'LaTeX-math-mode
              'turn-on-reftex
              'linum-mode))
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-auto-untabify t ;; remove all tabs before saving
                    TeX-engine 'xetex ;; ('xetex) | ('default)
                    TeX-show-compilation t) ;; display compilation windows
              (TeX-global-PDF-mode t) ;; PDF mode enable, not plain
              (setq TeX-save-query nil)
              (imenu-add-menubar-index)
              ;; (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
              ))
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-view-program-list
        '(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o"))))
  (setq TeX-view-program-selection
        '((output-pdf "Sumatra PDF")
          (output-dvi "xdvi")))
  (setq TeX-insert-quote t)
  ;; (ispell-change-dictionary "american" t)
  ;; (setq-default ispell-program-name "aspell")

  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  )

;;;end emacs + auctex


(provide 'init-auctex)
