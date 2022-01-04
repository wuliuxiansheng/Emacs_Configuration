;;; Gnus Mail Configuration

(require-package 'bbdb)

;; import from Gmail contacts
(require-package 'gmail2bbdb)
(autoload 'gmail2bbdb-import-file "gmail2bbdb" nil t nil)

;; Read HTML mail
;; (require-package 'w3m)
;; (setq mm-inline-text-html-with-images t)
;; (setq w3m-default-display-inline-images t)

(when *is-a-mac*
  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e"))
(require 'mu4e)
(setq mu4e-headers-include-related t)
(setq mu4e-change-filename-when-moving t)

;; (setq mu4e-get-mail-command "mbsync -a")
(setq mu4e-get-mail-command (format "INSIDE_EMACS=%s mbsync -a" emacs-version)
      epa-pinentry-mode 'ask)

(setq mu4e-maildir "~/.mail")
(setq mu4e-drafts-folder "/Gmail/[Gmail]/Drafts")
(setq mu4e-sent-folder "/Gmail/[Gmail]/Sent Mail")
(setq mu4e-refile-folder "/Gmail/[Gmail]/All Mail")
(setq mu4e-trash-folder "/Gmail/[Gmail]/Trash")

(add-to-list 'mu4e-bookmarks
             (make-mu4e-bookmark
              :name "Inbox - Gmail"
              :query "maildir:/Gmail/INBOX"
              :key ?i))

(setq mu4e-maildir-shortcuts
      '(("/Gmail/INBOX" . ?i)
        ("/Gmail/[Gmail]/Sent Mail" . ?s)
        ))

(defun my-render-html-message ()
  (let ((dom (libxml-parse-html-region (point-min) (point-max))))
    (erase-buffer)
    (shr-insert-document dom)
    (goto-char (point-min))))
(setq mu4e-html2text-command 'my-render-html-message)
(setq mu4e-view-prefer-html t) ;; try to render

;; (setq mu4e-html2text-command "w3m -T text/html")
;; (setq mu4e-html2text-command "/usr/local/bin/w3m -T text/html")

;; SMTP configuration
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 587)
(setq smtpmail-stream-type 'starttls)

(setq mu4e-compose-signature
      (concat
       "Chao Liu\n"
       "Postdoctoral Associate at MIT CSAIL\n"
       "https://www.chaoliu.tech"))

;; don't keep message compose buffers around after sending:
(setq message-kill-buffer-on-exit t)


(provide 'init-mail)
