;;;set the default font and size
(when *is-a-mac*
  (set-frame-font "-*-Menlo-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  ;; (setq ring-bell-function 'ignore);turn the alarm totally off because of the bug in Capitan EI
  )
(when *is-a-linux*
  (set-frame-font "-unkonwn-Ubuntu Mono-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1"))
(when *is-a-windows*
  (set-frame-font "-outline-Courier New-normal-normal-normal-mono-16-*-*-*-c-*-iso8859-1")
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")  ; add aspell directory to emacs configuration
  (setq grep-find-command '("findstr /sn  *" . 13))
  (setq default-directory "~/"))

(global-linum-mode t);show line number

;;;cursor stop blinking
(blink-cursor-mode -1)
(transient-mark-mode 1)

;;;highlight the current row
(require 'hl-line)
(global-hl-line-mode t)

(provide 'init-preload-local)
