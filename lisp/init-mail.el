;;; Gnus Mail Configuration

(require-package 'bbdb)

;; import from Gmail contacts
(require-package 'gmail2bbdb)
(autoload 'gmail2bbdb-import-file "gmail2bbdb" nil t nil)

;; Read HTML mail
;; (require-package 'w3m)
;; (setq mm-inline-text-html-with-images t)
;; (setq w3m-default-display-inline-images t)


(provide 'init-mail)
