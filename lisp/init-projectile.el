(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  (after-load 'projectile
    (setq-default
     projectile-mode-line
     '(:eval
       (if (file-remote-p default-directory)
           " Proj"
         (format " Proj[%s]" (projectile-project-name))))))

  (setq projectile-keymap-prefix (kbd "C-c p"))

  ;;Configuration for Windows
  (when *is-a-windows*
    (setq projectile-indexing-method 'alien))
  )


(provide 'init-projectile)
