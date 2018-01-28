;;;yasnippet
(require-package 'yasnippet)
(require 'yasnippet)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(yas-global-mode t)

(require-package 'yasnippet-snippets)

(provide 'init-yasnippet)
