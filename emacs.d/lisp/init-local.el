;;; Personal Information
(setq user-full-name "Chao Liu")
(setq user-mail-address "chaoliu@seas.upenn.edu")

;;; bind M-SPC to set-mark command rather than C-SPC for Windows
;; (when *is-a-windows*
;;   (global-unset-key (kbd "C-SPC"))
;;   (global-set-key (kbd "M-SPC") 'set-mark-command))

(provide 'init-local)
