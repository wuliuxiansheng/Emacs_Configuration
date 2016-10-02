;;; Use deft to manage notes

(require-package 'deft)

(setq deft-extensions '("org"))
(setq deft-directory "~/Dropbox/OrgNotes")
(setq deft-text-mode 'org-mode)

;; Enable subdirectories search
(setq deft-recursive t)

;; global key binding to launch deft
(global-set-key (kbd "C-x N") 'deft)

(setq deft-use-filename-as-title t)
(setq deft-use-filter-string-for-filename t)

;; disable auto save because of trailing whitespace configuration
(setq deft-auto-save-interval 0)

(setq deft-markdown-mode-title-level 2)
(setq deft-org-mode-title-prefix t)

(setq deft-incremental-search nil)

(setq deft-current-sort-method 'title)

;; global key binding to find files in deft directory
(global-set-key (kbd "C-c C-f") 'deft-find-file)

(provide 'init-deft)
