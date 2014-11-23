;;; ac-haskell-process-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ac-haskell-process-popup-doc ac-haskell-process-setup)
;;;;;;  "ac-haskell-process" "ac-haskell-process.el" (21618 20859
;;;;;;  0 0))
;;; Generated autoloads from ac-haskell-process.el

(defconst ac-source-haskell-process '((available . ac-haskell-process-available-p) (candidates . ac-haskell-process-candidates) (document . ac-haskell-process-doc) (symbol . "h")) "\
Haskell auto-complete source which uses the current haskell process.")

(autoload 'ac-haskell-process-setup "ac-haskell-process" "\
Add the haskell process completion source to the front of `ac-sources'.
This affects only the current buffer.

\(fn)" t nil)

(autoload 'ac-haskell-process-popup-doc "ac-haskell-process" "\
Show documentation for the symbol at point in a popup.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("ac-haskell-process-pkg.el") (21618 20859
;;;;;;  930258 0))

;;;***

(provide 'ac-haskell-process-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ac-haskell-process-autoloads.el ends here
