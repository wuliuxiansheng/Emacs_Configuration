(require-package 'arduino-mode)
(setq ede-arduino-appdir "~/arduino-ide")

(require-package 'company-arduino)

(defun company-arduino-header-path ()
  "Return the arduino include path for the current buffer."
  (let ((default '("~/Arduino/libraries/" "~/Arduino/hardware/" "~/arduino-ide/libraries/")))
    (company-arduino-append-include-dirs default t)))

(defvar company-user-arduino-includes-dirs
  '("-I/home/chaoliu/Arduino/hardware/" "-I/home/chaoliu/Arduino/libraries/"))

(eval-after-load 'company-arduino
  '(setq irony-arduino-includes-options (append irony-arduino-includes-options company-user-arduino-includes-dirs)))

;;; Irony reconfiguration
(require-package 'irony)
(require 'irony)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;; company-irony configuration
(require-package 'company-irony)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-irony-ignore-case 'smart)
(defun company-irony-setup ()
  "Configure company-backends for company-irony."
  (push '(company-irony :with company-yasnippet) company-backends))

;;; flycheck-irony
;; (require-package 'flycheck-irony)

(defun arduino-enable ()
  "Start arduino mode."
  (interactive)
  (add-to-list 'irony-supported-major-modes 'arduino-mode)
  (add-to-list 'irony-lang-compile-option-alist '(arduino-mode . "c++"))
  (add-hook 'irony-mode-hook 'company-arduino-turn-on)
  (setq company-c-headers-path-system 'company-arduino-header-path)
  (add-hook 'arduino-mode-hook 'irony-mode)
  ;; add company-c-headers to company-backends before company-irony
  (add-hook 'arduino-mode-hook 'company-c-headers-setup)
  (add-hook 'arduino-mode-hook 'company-irony-setup)
  ;; (eval-after-load 'flycheck
  ;; 	'(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  )

(defun arduino-disable ()
  "Disable arduino mode."
  (interactive)
  (delete 'arduino-mode irony-supported-major-modes)
  (delete '(arduino-mode . "c++") irony-lang-compile-option-alist)
  (remove-hook 'irony-mode-hook 'company-arduino-turn-on)
  (setq company-c-headers-path-system 'ede-object-system-include-path)
  (remove-hook 'arduino-mode-hook 'irony-mode)
  (remove-hook 'arduino-mode-hook 'company-irony-setup)
  (remove-hook 'arduino-mode-hook 'company-c-headers-setup)
  ;; (remove-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )


(provide 'init-arduino)
