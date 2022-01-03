;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; TODO Default sort order should place [a-z] before punctuation

(setq tab-always-indent 'complete)  ;; use 't when company is disabled
(add-to-list 'completion-styles 'initials t)

(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (diminish 'company-mode)
    (define-key company-mode-map (kbd "M-/") 'company-complete)
    (define-key company-mode-map [remap completion-at-point] 'company-complete)
    (define-key company-mode-map [remap indent-for-tab-command] 'company-indent-or-complete-common)
    (define-key company-active-map (kbd "M-/") 'company-other-backend)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "M-.") 'company-show-location)
    (setq-default company-dabbrev-other-buffers 'all
                  company-tooltip-align-annotations t)
    ;; use numbers 0-9 to select company completion candidates
    ;; (setq company-show-numbers t)
    ;; (let ((map company-active-map))
    ;;   (mapc (lambda (x) (define-key map (format "%d" x)
    ;; 				 `(lambda () (interactive) (company-complete-number ,x))))
    ;; 		(number-sequence 0 9)))
    )
  (global-set-key (kbd "M-C-/") 'company-complete)
  (when (maybe-require-package 'company-quickhelp)
    (add-hook 'after-init-hook 'company-quickhelp-mode)))


(provide 'init-company)
;;; init-company.el ends here
