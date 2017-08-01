(add-to-list 'load-path "/opt/ros/indigo/share/emacs/site-lisp")

(require 'rosemacs-config)

(require-package 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(provide 'init-ros)
