(require-package 'pymacs)

;;; pymacs configuration
(eval-after-load 'python
'(progn
  (autoload 'pymacs-apply "pymacs")
  (autoload 'pymacs-call "pymacs")
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-exec "pymacs" nil t)
  (autoload 'pymacs-load "pymacs" nil t)
  (message "loading ropemacs")
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)))
;;; integrate ropemacs with auto-complete
;;(ac-ropemacs-initialize)
;; (add-hook 'python-mode-hook
;; (lambda ()
;;   (add-to-list 'ac-sources 'ac-source-ropemacs)))


(provide 'init-pymacs)
