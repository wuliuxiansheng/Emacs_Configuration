;;; skewer-less-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "skewer-less" "skewer-less.el" (21911 30644
;;;;;;  0 0))
;;; Generated autoloads from skewer-less.el

(autoload 'skewer-less-mode "skewer-less" "\
Minor mode allowing LESS stylesheet manipulation via `skewer-mode'.

Operates by invoking \"less.refresh()\" via skewer whenever the
buffer is saved.

For this to work properly, the less javascript should be included
in the target web page, and less should be configured in
development mode, using:

        var less = {env: \"development\"};

before including \"less.js\".

\(fn &optional ARG)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; skewer-less-autoloads.el ends here
