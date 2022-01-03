;;; init-spelling.el --- Spell check settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'ispell)

;; configure personal dictionary locaion
(setq ispell-personal-dictionary "~/Dropbox (MIT)/Notes/.aspell.en.pws")
;; check and correct spelling of the word at point or a region
(global-set-key (kbd "M-c") 'ispell-word)

(when (executable-find ispell-program-name)
  ;; Add spell-checking in comments for all programming language modes
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  ;; add spell-checking for tex mode
  (add-hook 'LaTeX-mode-hook 'flyspell-mode)
  ;; add spell-checking for markdown mode
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  ;; add spell checking for git commit
  (add-hook 'git-commit-setup-hook 'flyspell-mode)

  (with-eval-after-load 'flyspell
    (define-key flyspell-mode-map (kbd "C-;") nil)
    (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)))

(provide 'init-spelling)
;;; init-spelling.el ends here
