;;; fullframe-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (fullframe) "fullframe" "fullframe.el" (21618 20664
;;;;;;  0 0))
;;; Generated autoloads from fullframe.el

(autoload 'fullframe "fullframe" "\
Save window/frame state when executing COMMAND-ON.

Advises COMMAND-ON so that the buffer it displays will appear in
a full-frame window.  The previous window configuration will be
restored when COMMAND-OFF is executed in that buffer.  If
KILL-ON-COFF is non-nil, then the buffer will also be killed
after COMMAND-OFF has completed.

IGNORED is there for backcompatibillitys sake -- ignore it.

\(fn COMMAND-ON COMMAND-OFF &optional KILL-ON-COFF IGNORED)" nil t)

;;;***

;;;### (autoloads nil nil ("fullframe-pkg.el") (21618 20664 608660
;;;;;;  0))

;;;***

(provide 'fullframe-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; fullframe-autoloads.el ends here
