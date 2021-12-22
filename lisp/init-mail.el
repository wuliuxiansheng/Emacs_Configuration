;;; Gnus Mail Configuration

(require-package 'bbdb)

;; import from Gmail contacts
(require-package 'gmail2bbdb)
(autoload 'gmail2bbdb-import-file "gmail2bbdb" nil t nil)

;; Read HTML mail
;; (require-package 'w3m)
;; (setq mm-inline-text-html-with-images t)
;; (setq w3m-default-display-inline-images t)

(require 'mu4e)
(setq mu4e-headers-include-related t)
(setq mu4e-change-filename-when-moving t)

(setq mu4e-get-mail-command "mbsync -a")

(setq mu4e-maildir "~/.mail/Gmail")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder "/Sent")
(setq mu4e-refile-folder "/All Mail")
(setq mu4e-trash-folder "/Trash")

;; SMTP configuration
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 587)
(setq smtpmail-stream-type 'starttls)



(provide 'init-mail)
