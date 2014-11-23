;;; github-clone-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (eshell/github-clone github-clone) "github-clone"
;;;;;;  "github-clone.el" (21618 20768 0 0))
;;; Generated autoloads from github-clone.el

(autoload 'github-clone "github-clone" "\
Fork and clone USER-REPO-URL into DIRECTORY.

USER-REPO-URL can be any of the forms:

  repository
  user/repository
  organization/repository
  https://github.com/user/repository
  git@github.com:user/repository.git
  https://github.com/user/repository.el.git

It will immediately clone the repository (as the origin) to
DIRECTORY. Then it prompts to fork the repository and add a
remote named after the github username to the fork.

\(fn USER-REPO-URL DIRECTORY)" t nil)

(autoload 'eshell/github-clone "github-clone" "\
Eshell alias uses current directory as default.

\(fn USER-REPO-URL &optional DIRECTORY)" nil nil)

;;;***

;;;### (autoloads nil nil ("github-clone-pkg.el") (21618 20768 582765
;;;;;;  0))

;;;***

(provide 'github-clone-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; github-clone-autoloads.el ends here
