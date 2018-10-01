(when *is-a-mac*
  ;; (setq ring-bell-function 'ignore);turn the alarm totally off because of the bug in Capitan EI
  )
(when *is-a-linux*
  )
(when *is-a-windows*
  (add-to-list 'exec-path "C:/Program Files (x86)/Aspell/bin/")  ; add aspell directory to emacs configuration
  (setq grep-find-command '("findstr /sn  *" . 13))
  (setq default-directory "~/"))

(provide 'init-preload-local)
