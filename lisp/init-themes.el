(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)

;; If you don't customize it, this is the theme you get.
(when *is-a-mac*
  (setq-default custom-enabled-themes '(sanityinc-solarized-light)))
(when *is-a-linux*
  (setq-default custom-enabled-themes '(sanityinc-solarized-dark)))
(when *is-a-windows*
      (setq-default custom-enabled-themes '(sanityinc-solarized-light)))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-solarized-light)
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (color-theme-sanityinc-solarized-dark)
  (reapply-themes))

;;------------------------------------------------------------------------------
;; Theme Configuration for Org-mode
;;------------------------------------------------------------------------------

;; leuven is a good theme for org-mode and you can switch to it if you want
(require-package 'leuven-theme)
;; (setq org-fontify-whole-heading-line t)
;; (require-package 'load-theme-buffer-local)

;; (add-hook 'org-mode-hook
;; 		  (lambda nil (load-theme-buffer-local 'leuven (current-buffer))))

;; (add-hook 'org-mode-hook
;; 		  (lambda ()
;; 			(load-theme 'leuven t)
;; 			(setq org-fontify-whole-heading-line t)))

(provide 'init-themes)
