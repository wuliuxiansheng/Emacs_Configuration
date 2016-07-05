;;;set the default font and size

(when *is-a-mac*
  (set-frame-font "-*-Menlo-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  ;; configure Chinese characters to align tables
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
					  charset (font-spec :family "Arial Unicode MS" :size 16.5)))
  ;; (setq ring-bell-function 'ignore);turn the alarm totally off because of the bug in Capitan EI
  )
(when *is-a-linux*
  (set-frame-font "-unkonwn-Ubuntu Mono-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
  ;; configure Chinese characters to align tables
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
					  charset (font-spec :family "Droid Sans" :size 16.5))))
(when *is-a-windows*
  (set-frame-font "-outline-Courier New-normal-normal-normal-mono-14-*-*-*-c-*-iso8859-1")
  ;; configure Chinese characters to align tables
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
					  charset (font-spec :family "NSimsun" :size 15)))
  ;; (setq face-font-rescale-alist '(("NSimsun" . 1.2) ("MS Gothic" . 1.2)))
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")  ; add aspell directory to emacs configuration
  (setq grep-find-command '("findstr /sn  *" . 13))
  (setq default-directory "~/"))

;; line number configuration
(global-linum-mode t);show line number
;; disable line number display for some modes
(setq linum-disabled-modes-list '(eshell-mode term-mode org-mode text-mode))
(defun linum-on ()
  (unless (or (minibufferp)
			  (member major-mode linum-disabled-modes-list))
	(linum-mode 1)))

;;;cursor stop blinking
(blink-cursor-mode -1)
(transient-mark-mode 1)

;;;highlight the current row
(require 'hl-line)
(global-hl-line-mode t)

(provide 'init-preload-local)
