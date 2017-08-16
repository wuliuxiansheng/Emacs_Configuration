;;;set the default font and size

(when *is-a-mac*
  ;; (setq ring-bell-function 'ignore);turn the alarm totally off because of the bug in Capitan EI
  )
(when *is-a-linux*
  )
(when *is-a-windows*
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")  ; add aspell directory to emacs configuration
  (setq grep-find-command '("findstr /sn  *" . 13))
  (setq default-directory "~/"))

;; line number configuration
(global-linum-mode t);show line number
;; disable line number display for some modes
(setq linum-disabled-modes-list '(eshell-mode shell-mode term-mode org-mode text-mode inferior-python-mode TeX-output-mode compilation-mode comint-mode blog-admin-mode))
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
