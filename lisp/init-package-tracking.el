(require-package 'pkg-info)

;; record all installed packages with name+version in a file
(defun record-current-package ()
  "Record the current package in format package: verison and save the data in ~/.emacs.d/package-tracking.el."
  (interactive)
  (dolist (pkg package-activated-list)
    (setq pkg-string (format "%s" pkg))
    (append-to-file (format "%s: %s\n" pkg-string (pkg-info-format-version (pkg-info-package-version pkg))) nil "~/.emacs.d/package-tracking.el")))

(provide 'init-package-tracking)
