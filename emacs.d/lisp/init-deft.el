;;; Use deft to manage notes

(require-package 'deft)

(setq deft-extensions '("org" "txt"))
(setq deft-directory "~/Dropbox/OrgNotes")

;; Enable subdirectories search
(setq deft-recursive t)

;; global key binding to launch deft
(global-set-key (kbd "C-x N") 'deft)

(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)

(setq deft-markdown-mode-title-level 2)
(setq deft-org-mode-title-prefix t)

(setq deft-current-sort-method 'title)

;; global key binding to find files in deft directory
(global-set-key (kbd "C-x C-s") 'deft-find-file)

(provide 'init-deft)
