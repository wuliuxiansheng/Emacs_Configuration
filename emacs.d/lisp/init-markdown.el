(when (maybe-require-package 'markdown-mode)
  (after-load 'whitespace-cleanup-mode
    (push 'markdown-mode whitespace-cleanup-mode-ignore-modes)))

;; add spell-checking for markdown mode
(add-hook 'markdown-mode-hook 'flyspell-mode)

(provide 'init-markdown)
