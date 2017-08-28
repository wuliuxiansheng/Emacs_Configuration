(add-to-list 'load-path "/opt/ros/indigo/share/emacs/site-lisp")

(require 'rosemacs-config)

(after-load 'rosemacs
  (after-load 'redshank
	(define-key redshank-mode-map (kbd "C-x C-r C-l") nil)))

(require-package 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(provide 'init-ros)
