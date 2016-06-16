;;; Use deft to manage notes

(require-package 'deft)

(setq deft-extensions '("org" "txt"))
(setq deft-directory "~/Dropbox/OrgNotes")

;; Enable subdirectories search
(setq deft-recursive t)

(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)

(setq deft-markdown-mode-title-level 2)
(setq deft-org-mode-title-prefix t)

(setq deft-current-sort-method 'title)

;; find files in deft directory
(global-set-key (kbd "C-x C-g") 'deft-find-file)

(provide 'init-deft)
