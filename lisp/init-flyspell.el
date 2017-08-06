;;----------------------------------------------------------------------------
;; Add spell-checking in comments for all programming language modes
;;----------------------------------------------------------------------------
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; add spell-checking for tex mode
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; add spell-checking for markdown mode
(add-hook 'markdown-mode-hook 'flyspell-mode)
;; add spell checking for git commit
(add-hook 'git-commit-setup-hook 'flyspell-mode)

(after-load 'flyspell
  (add-to-list 'flyspell-prog-text-faces 'nxml-text-face))

(eval-after-load "flyspell"
  '(define-key flyspell-mode-map (kbd "C-;") nil))


(provide 'init-flyspell)
