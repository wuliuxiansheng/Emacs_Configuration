;;; emacs + auctex

(require-package 'auctex)
(require-package 'ivy-bibtex)

;; auctex configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("PDFLaTeX" "%`pdflatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
            (add-to-list 'TeX-command-list '("XeTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))
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
                  TeX-engine 'xetex   ;; ('xetex) | ('default)
                  TeX-show-compilation t) ;; display compilation windows
            (TeX-global-PDF-mode t) ;; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            ;; (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            ))

(setq TeX-insert-quote t)
;; (ispell-change-dictionary "american" t)
;; (setq-default ispell-program-name "aspell")
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; ivy-bibtex configuration
(autoload 'ivy-bibtex "ivy-bibtex" "" t)
(setq ivy-re-builders-alist
      '((ivy-bibtex . ivy--regex-ignore-order)
        (t . ivy--regex-plus)))
(setq bibtex-completion-bibliography
      '("~/Documents/tether_tube_robots-svn/resource/papers.bib"
        "~/Documents/smores-svn/reconfiguration/ref/papers.bib"))
(setq bibtex-completion-library-path
      '("~/Documents/smores-svn/reconfiguration/ref"
        "~/Documents/smores-svn/reconfiguration/ref/assembly"
        "~/Documents/smores-svn/reconfiguration/ref/control"
        "~/Documents/smores-svn/reconfiguration/ref/diff-drive_planning"
        "~/Documents/smores-svn/reconfiguration/ref/hardware"
        "~/Documents/smores-svn/reconfiguration/ref/isomorphism"
        "~/Documents/smores-svn/reconfiguration/ref/kinematics"
        "~/Documents/smores-svn/reconfiguration/ref/reconfiguration"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning/arm"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning/collision"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning/humanoid"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning/locomotion"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning/manipulation"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning/quadratic programming"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning/rrt and prm"
        "~/Documents/smores-svn/reconfiguration/ref/motion_planning/task_planning"
        "~/Documents/tether_tube_robots-svn/resource"
        "~/Documents/tether_tube_robots-svn/resource/kinematics/Jacobian"
        "~/Documents/tether_tube_robots-svn/resource/kinematics/Manipulability"
        "~/Documents/tether_tube_robots-svn/resource/kinematics/Task"
        "~/Documents/tether_tube_robots-svn/resource/kinematics/Workspace"
        "~/Documents/tether_tube_robots-svn/resource/tether_robot"
        "~/Documents/tether_tube_robots-svn/resource/control_planning"
        "~/Documents/tether_tube_robots-svn/resource/aerial_manipulator"
        "~/Documents/tether_tube_robots-svn/resource/aerial_manipulator/compliant"
        "~/Documents/tether_tube_robots-svn/resource/aerial_manipulator/parallel_manipulator"
        "~/Documents/tether_tube_robots-svn/resource/aerial_manipulator/serial_manipulator"
        "~/Documents/tether_tube_robots-svn/resource/hardware"))
;; (after-load 'ivy
;;   (ivy-add-actions
;;    'ivy-bibtex
;;    '(("i" ivy-bibtex-insert-bibtex "Insert citation"))))

(setq bibtex-completion-pdf-open-function
      (lambda (fpath)
        (call-process "open" nil 0 nil fpath)))

(when *is-a-mac*
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-view-program-list
        '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")("Preview" "open -a Preview.app %o")))
  (setq TeX-view-program-selection
        '((output-pdf "Skim")
          (output-dvi "xdvi")))
  )

(when *is-a-linux*
  ;; Synctex with Okular
  (setq TeX-source-correlate-mode t
        TeX-source-correlate-start-server t)
  (eval-after-load "tex"
    '(setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Okular"))
  (setq TeX-source-correlate-method 'synctex)
  )

(when *is-a-windows*
  (setq TeX-source-correlate-mode t)
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-view-program-list
        '(("Sumatra PDF" ("\"C:/Program Files/SumatraPDF/SumatraPDF.exe\" -reuse-instance" (mode-io-correlate " -forward-search %b %n ") " %o"))))
  (setq TeX-view-program-selection
        '((output-pdf "Sumatra PDF")
          (output-dvi "xdvi")))
  )

;;;end emacs + auctex


(provide 'init-tex)
