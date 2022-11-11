;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Proj")

  ;; (when (executable-find "rg")
  ;;   (setq-default projectile-generic-command "rg --files --hidden"))

  (with-eval-after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

  (maybe-require-package 'ibuffer-projectile)

  ;;Configuration for Windows
  (when *is-a-windows*
    (setq projectile-indexing-method 'alien))

  ;; required for non Git or SVN projects
  ;; (when (not *is-a-windows*)
  ;;   (setq projectile-indexing-method 'naive))

  )


(provide 'init-projectile)
