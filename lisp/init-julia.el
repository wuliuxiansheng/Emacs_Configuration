(require-package 'julia-mode)
(require-package 'julia-repl)
(add-hook 'julia-mode-hook 'julia-repl-mode)

(provide 'init-julia)
