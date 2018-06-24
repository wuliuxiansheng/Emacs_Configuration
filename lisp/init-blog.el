;;; blog configuration
(require-package 'blog-admin)

(require 'blog-admin)

(setq blog-admin-backend-path "~/Documents/blog")
(setq blog-admin-backend-type 'hexo)
(setq blog-admin-backend-new-post-in-drafts t) ;; create new post in drafts by default
(setq blog-admin-backend-new-post-with-same-name-dir t) ;; create same-name directory with new post
(setq blog-admin-backend-hexo-config-file "_config.yml") ;; default assumes _config.yml

(defun blog-shell-command ()
  "Make \"shell-command\" to be interactive for blog mode."
  (setq shell-command-switch "-ic"))
(when *is-a-linux*
  (add-hook 'blog-admin-mode-hook 'blog-shell-command))

(provide 'init-blog)
