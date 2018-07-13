(require 'nnir)

(setq gnus-select-method '(nntp "news.gmane.org"))

;; ask encryption password once
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;; email account configuration
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "gmail"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-search-engine imap)
                      (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")
                      (nnmail-expiry-wait 90)))

(add-to-list 'gnus-secondary-select-methods
             '(nnimap "seas.upenn"
                      (nnimap-address "chaoliu.mail.seas.upenn.edu")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-search-engine imap)
                      (nnmail-expiry-wait 90)))

(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)))

;; NO 'passive
(setq gnus-use-cache t)

;; BBDB configuration
(require 'bbdb)
(bbdb-initialize 'message 'gnus 'sendmail)
(bbdb-insinuate-message)
(bbdb-mua-auto-update-init 'gnus 'message)

;; configure pop-up window size
(setq bbdb-pop-up-window-size 0.15)
(setq bbdb-mua-pop-up-window-size 0.3)

;; configure bbdb to ask whether storing the contact or not
(setq bbdb-mua-update-interactive-p '(query . create))
;; ensure searching all email addresses in a message
(setq bbdb-message-all-addresses t)

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(setq bbdb/mail-auto-create-p t
	  bbdb/news-auto-create-p t)

(setq bbdb-file "~/Dropbox/Personal/.bbdb")

;; BBDB company mode
(defun company-bbdb-setup ()
  (add-to-list 'company-backends 'company-bbdb))
(add-hook 'message-mode-hook 'company-bbdb-setup)

;; auto-complete emacs address using bbdb UI
(add-hook 'message-mode-hook
		  '(lambda ()
			 (flyspell-mode t)
			 (local-set-key "<TAB>" 'bbdb-complete-name)))

;; Fetch only part of the article if we can
;; not working in Emacs 26
;; (setq gnus-have-read-active-file 'some)

;; Tree view for groups
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Threads configuration
(setq gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject)

(setq gnus-thread-hide-subtree t)
(setq gnus-thread-ignore-subject t)

;; Personal Information
(setq user-full-name "Chao Liu"
	  user-mail-address "chaoliu@seas.upenn.edu")

;; Use w3m to read HTML email
;; (setq mm-text-html-renderer 'w3m)

;; Setup to send email through SMTP
;; Customize mail address in Gmail setting
(setq message-send-mail-function 'smtpmail-send-it
	  smtpmail-default-smtp-server "smtp.gmail.com"
	  smtpmail-smtp-service 587
	  smtpmail-local-domain "homepc")
;; (setq message-send-mail-function 'smtpmail-send-it
;;	  smtpmail-default-smtp-server "smtp.seas.upenn.edu"
;;	  smtpmail-smtp-service 587
;;	  smtpmail-local-domain "homepc")

(setq gnus-use-correct-string-widths nil)

(eval-after-load 'gnus-topic
  '(progn
     ;; (setq gnus-message-archive-group "nnimap+seas.upenn:Sent Messages")
     (setq gnus-message-archive-group "nnimap+gmail:[Gmail]/已发邮件")
     (setq gnus-server-alist '(("archive" nnfolder "archive" (nnfolder-directory "~/Mail/archive")
                                (nnfolder-active-file "~/Mail/archive/active")
                                (nnfolder-get-new-mail nil)
                                (nnfolder-inhibit-expiry t))))

     (setq gnus-topic-topology '(("Gnus" visible)
                                 (("misc" visible))
                                 (("gmail" visible))
                                 (("seas.upenn" visible))))

     (setq gnus-topic-alist '(("misc"
                               "nndraft:drafts")
                              ("gmail"
                               "INBOX"
                               "[Gmail]/Sent Mail"
                               "[Gmail]/Trash"
                               "Sent Messages"
                               "Drafts")
                              ("seas.upenn"
                               "nnimap+seas.upenn:Inbox"
                               "nnimap+seas.upenn:Drafts"
                               "nnimap+seas.upenn:Sent"
                               "nnimap+seas.upenn:Junk"
                               "nnimap+seas.upenn:Deleted Messages")
                              ("Gnus")
                              ))
     ))

;; Signature
(setq message-signature-file "~/.emacs.d/.signature")
