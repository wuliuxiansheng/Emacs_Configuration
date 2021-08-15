;; -*- lexical-binding: t -*-
(setq debug-on-error t)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "24.5")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* t) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))
(defconst *is-a-windows* (eq system-type 'windows-nt))

(setq ad-redefinition-action 'accept) ;; ignore the redefinition warning
(setq debug-on-error nil) ;; turn off debug-on-error

;;----------------------------------------------------------------------------
;; Set installation mode: text, programming, full
;;----------------------------------------------------------------------------
(setq install-mode "full")

(let ((install-modes '("full" "text" "programming")))
  (when (not (member install-mode install-modes))
	(error "Set install-mode from full, text or programming")))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'command-log-mode)

(require 'init-package-tracking)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-neotree)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
(require 'init-smex)
(require 'init-ivy)
(require 'init-hippie-expand)
(require 'init-company)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)

(require 'init-editing-utils)
(require 'init-whitespace)
(require 'init-fci)

(require 'init-vc)
(require 'init-darcs)
(require 'init-git)
(require 'init-github)

(require 'init-projectile)

(require 'init-compile)
(require 'init-csv)
(require 'init-org)
(require 'init-deft)
(require 'init-code)

(require 'init-yasnippet)

(when (not (string-equal install-mode "text"))
  (require 'init-lsp)
  (require 'init-nxml)
  (require 'init-html)
  (require 'init-python-mode)
  (require 'init-cc-mode)
  (when *is-a-linux*
    (require 'init-ros))
  (require 'init-csharp)
  (require 'init-matlab-mode)
  (require 'init-arduino))

(when (not *is-a-windows*)
  (require 'init-multi-term))

(require 'init-yaml)
(require 'init-paredit)
(require 'init-lisp)
(require 'init-slime)

(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-misc)

(require 'init-folding)
(require 'init-dash)
(require 'init-ledger)

(when (not (string-equal install-mode "programming"))
  (require 'init-markdown)
  (require 'init-tex)
  ;; (require 'init-ac-math)
  (require 'init-company-math)
  (require 'init-mail)
  (require 'init-blog))

(require 'init-ssh)
;; Extra packages which don't require any configuration
(require-package 'gnuplot)
(require-package 'htmlize)
;; (when (not *is-a-windows*)
;;   (require-package 'dsvn)
;;   (autoload 'svn-status "dsvn" "Run `svn status'." t)
;;   (autoload 'svn-update "dsvn" "Run `svn update'." t)
;;   )
;; (require-package 'psvn)
(when *is-a-mac*
  (require-package 'osx-location))
(maybe-require-package 'regex-tool)
(maybe-require-package 'dotenv-mode)

(when (maybe-require-package 'uptimes)
  (setq-default uptimes-keep-count 200)
  (add-hook 'after-init-hook (lambda () (require 'uptimes))))


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)



(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
