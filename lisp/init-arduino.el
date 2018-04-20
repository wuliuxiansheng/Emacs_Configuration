(require-package 'arduino-mode)
(setq ede-arduino-appdir "~/arduino-ide")

(require-package 'company-arduino)

(defun arduino-enable ()
  "Start arduino mode."
  (interactive)
  (add-to-list 'irony-supported-major-modes 'arduino-mode)
  (add-hook 'irony-mode-hook 'company-arduino-turn-on)
  (add-to-list 'company-c-headers-path-system 'company-arduino-includes-dirs)
  (add-hook 'arduino-mode-hook 'irony-mode)
  (add-hook 'arduino-mode-hook 'company-irony-setup)
  (add-hook 'arduino-mode-hook 'company-c-headers-setup))

(defun arduino-disable ()
  "Disable arduino mode."
  (interactive)
  (delete 'arduino-mode irony-supported-major-modes)
  (remove-hook 'irony-mode-hook 'company-arduino-turn-on)
  (delete 'company-arduino-includes-dirs company-c-headers-path-system)
  (remove-hook 'arduino-mode-hook 'irony-mode)
  (remove-hook 'arduino-mode-hook 'company-irony-setup)
  (remove-hook 'arduino-mode-hook 'company-c-headers-setup))


(provide 'init-arduino)
