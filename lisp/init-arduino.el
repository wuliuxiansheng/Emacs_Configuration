(require-package 'arduino-mode)
(setq ede-arduino-appdir "~/arduino-ide")

(require-package 'company-arduino)

(defun company-arduino-header-path ()
  "Return the arduino include path for the current buffer."
  (let ((default '("~/Arduino/libraries/ros_lib/")))
    (company-arduino-append-include-dirs default t)))

;;; company-irony configuration
(require-package 'company-irony)
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(setq company-irony-ignore-case 'smart)
(defun company-irony-setup ()
  "Configure company-backends for company-irony."
  (push '(company-irony :with company-yasnippet) company-backends))

(defun arduino-enable ()
  "Start arduino mode."
  (interactive)
  (add-to-list 'irony-supported-major-modes 'arduino-mode)
  (add-hook 'irony-mode-hook 'company-arduino-turn-on)
  (setq company-c-headers-path-system 'company-arduino-header-path)
  (add-hook 'arduino-mode-hook 'irony-mode)
  ;; add company-c-headers to company-backends before company-irony
  (add-hook 'arduino-mode-hook 'company-c-headers-setup)
  (add-hook 'arduino-mode-hook 'company-irony-setup))

(defun arduino-disable ()
  "Disable arduino mode."
  (interactive)
  (delete 'arduino-mode irony-supported-major-modes)
  (remove-hook 'irony-mode-hook 'company-arduino-turn-on)
  (setq company-c-headers-path-system 'ede-object-system-include-path)
  (remove-hook 'arduino-mode-hook 'irony-mode)
  (remove-hook 'arduino-mode-hook 'company-irony-setup)
  (remove-hook 'arduino-mode-hook 'company-c-headers-setup))


(provide 'init-arduino)
