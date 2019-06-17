(require 'pkg-info)

;; record all installed packages with name+version in a file
(defun record-current-package ()
  "Record the current package in format package: verison and save the data in ~/.emacs.d/package-tracking.el."
  (interactive)
  (dolist (pkg package-activated-list)
    (message "package %s" pkg)
    (setq pkg-string (format "%s" pkg))
    (message "package string %s" pkg-string)
    (append-to-file (format "%s: %s\n" pkg-string (pkg-info-format-version (pkg-info-package-version pkg))) nil "~/.emacs.d/package-tracking.el")))

(provide 'init-package-tracking)
