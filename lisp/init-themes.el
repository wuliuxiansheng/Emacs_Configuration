;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
(setq custom-safe-themes t)

;; If you don't customize it, this is the theme you get.
(when *is-a-mac*
  (setq-default custom-enabled-themes '(sanityinc-solarized-light)))
(when *is-a-linux*
  (setq-default custom-enabled-themes '(sanityinc-tomorrow-bright)))
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



;; Toggle between light and dark

(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-solarized-light))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-bright))
  (reapply-themes))


(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.15)
  (add-hook 'after-init-hook 'dimmer-mode)
  (with-eval-after-load 'dimmer
    ;; TODO: file upstream as a PR
    (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all))))
  (with-eval-after-load 'dimmer
    ;; Don't dim in terminal windows. Even with 256 colours it can
    ;; lead to poor contrast.  Better would be to vary dimmer-fraction
    ;; according to frame type.
    (defun sanityinc/display-non-graphic-p ()
      (not (display-graphic-p)))
    (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p)))

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
;;; init-themes.el ends here
