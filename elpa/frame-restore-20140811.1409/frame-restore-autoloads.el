;;; frame-restore-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (frame-restore-mode) "frame-restore" "frame-restore.el"
;;;;;;  (21618 20705 0 0))
;;; Generated autoloads from frame-restore.el

(defvar frame-restore-mode nil "\
Non-nil if Frame-Restore mode is enabled.
See the command `frame-restore-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `frame-restore-mode'.")

(custom-autoload 'frame-restore-mode "frame-restore" nil)

(autoload 'frame-restore-mode "frame-restore" "\
Toggle Frame Restore Mode.

With a prefix argument ARG, enable Frame Restore mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil.

If Frame Restore mode is enabled, the state of the initial frame
is saved from one session to another.

\(fn &optional ARG)" t nil)

(define-obsolete-function-alias 'frame-restore 'frame-restore-mode "0.2")

;;;***

;;;### (autoloads nil nil ("frame-restore-pkg.el") (21618 20705 192063
;;;;;;  0))

;;;***

(provide 'frame-restore-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; frame-restore-autoloads.el ends here
