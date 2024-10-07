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

(setq mu4e-get-mail-command "mbsync -a")
(when *is-a-mac*
  (setq mu4e-get-mail-command (format "INSIDE_EMACS=%s mbsync -a" emacs-version)
        epa-pinentry-mode 'ask))

(setq mu4e-maildir "~/.mail")

(setq mu4e-contexts
      (list
       (make-mu4e-context
        :name "Personal"
        :match-func
        (lambda (msg)
          (when msg
            (string-prefix-p "/Gmail" (mu4e-message-field msg :maildir))))
        :vars '((user-mail-address . "chaoliu@csail.mit.edu")
                (user-full-name . "Chao Liu")
                (mu4e-drafts-folder . "/Gmail/[Gmail]/Drafts")
                (mu4e-sent-folder . "/Gmail/[Gmail]/Sent Mail")
                (mu4e-refile-folder . "/Gmail/[Gmail]/All Mail")
                (mu4e-trash-folder . "/Gmail/[Gmail]/Trash")
                (mu4e-maildir-shortcuts . (("/Gmail/INBOX" . ?i)
                                           ("/Gmail/[Gmail]/Sent Mail" . ?s)
                                           ("/Gmail/[Gmail]/Starred" . ?S)))
                (smtpmail-smtp-user . "chao.liu0307"))
        )

       (make-mu4e-context
        :name "Academia"
        :match-func
        (lambda (msg)
          (when msg
            (string-prefix-p "/Academia" (mu4e-message-field msg :maildir))))
        :vars '((user-mail-address . "chaoliuacademia@gmail.com")
                (user-full-name . "Chao Liu")
                (mu4e-drafts-folder . "/Academia/[Gmail]/Drafts")
                (mu4e-sent-folder . "/Academia/[Gmail]/Sent Mail")
                (mu4e-refile-folder . "/Academia/[Gmail]/All Mail")
                (mu4e-trash-folder . "/Academia/[Gmail]/Trash")
                (mu4e-maildir-shortcuts . (("/Academia/INBOX" . ?i)
                                           ("/Academia/[Gmail]/Sent Mail" . ?s)
                                           ("/Academia/[Gmail]/Starred" . ?S)))
                (smtpmail-smtp-user . "chaoliuacademia"))
        )))

;; mu4e version on mac is more recent
;; (if *is-a-mac*
;;     (progn
;;       (add-to-list 'mu4e-bookmarks
;;                    '(
;;                      :name "Starred - Gmail"
;;                      :query "maildir:/Gmail/[Gmail]/Starred"
;;                      :key ?s))
;;       (add-to-list 'mu4e-bookmarks
;;                    '(
;;                      :name "Inbox - Gmail"
;;                      :query "maildir:/Gmail/INBOX"
;;                      :key ?i)))
;;   (progn
;;     (add-to-list 'mu4e-bookmarks
;;                  (make-mu4e-bookmark
;;                   :name "Starred - Gmail"
;;                   :query "maildir:/Gmail/[Gmail]/Starred"
;;                   :key ?s))
;;     (add-to-list 'mu4e-bookmarks
;;                  (make-mu4e-bookmark
;;                   :name "Inbox - Gmail"
;;                   :query "maildir:/Gmail/INBOX"
;;                   :key ?i)))
;;   )

;; (setq mu4e-maildir-shortcuts
;;       '(("/Gmail/INBOX" . ?i)
;;         ("/Gmail/[Gmail]/Sent Mail" . ?s)
;;         ))

(setq mu4e-attachment-dir  "~/Downloads")
(setq mu4e-compose-keep-self-cc nil)
;; needed by mu4e<=1.4
;; (setq mu4e-user-mail-address-list (quote ("chaoliu@csail.mit.edu")))

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

;; mu4e cc & bcc
(add-hook 'mu4e-compose-mode-hook
          (defun mail/add-cc-and-bcc ()
            "My Function to automatically add Cc & Bcc: headers.
    This is in the mu4e compose mode."
            (save-excursion (message-add-header "Cc:\n"))
            (save-excursion (message-add-header "Bcc:\n"))))

;; don't keep message compose buffers around after sending:
(setq message-kill-buffer-on-exit t)


(provide 'init-mail)
