;;; Character sets

(defcustom sanityinc/force-default-font-for-symbols nil
  "When non-nil, force Emacs to use your default font for symbols."
  :type 'boolean)

(defun sanityinc/maybe-use-default-font-for-symbols ()
  "Force Emacs to render symbols using the default font, if so configured."
  (when sanityinc/force-default-font-for-symbols
    (set-fontset-font "fontset-default" 'symbol (face-attribute 'default :family))))

(add-hook 'after-init-hook 'sanityinc/maybe-use-default-font-for-symbols)


;;; Changing font sizes

(require-package 'default-text-scale)
(global-set-key (kbd "C-M-=") 'default-text-scale-increase)
(global-set-key (kbd "C-M--") 'default-text-scale-decrease)


(defun sanityinc/maybe-adjust-visual-fill-column ()
  "Readjust visual fill column when the global font size is modified.
This is helpful for writeroom-mode, in particular."
  (if visual-fill-column-mode
      (add-hook 'after-setting-font-hook 'visual-fill-column--adjust-window nil t)
    (remove-hook 'after-setting-font-hook 'visual-fill-column--adjust-window t)))

(add-hook 'visual-fill-column-mode-hook
          'sanityinc/maybe-adjust-visual-fill-column)

;;; Default font setting for different OS
(when *is-a-mac*
  (set-frame-font "-*-Menlo-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
  ;; configure Chinese characters to align tables
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
					  charset (font-spec :family "Arial Unicode MS" :size 16.5)))
  )
(when *is-a-linux*
  (set-frame-font "-unkonwn-Ubuntu Mono-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
  ;; configure Chinese characters to align tables
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
					  charset (font-spec :family "Droid Sans" :size 16.5))))
(when *is-a-windows*
  (set-frame-font "-outline-Courier New-normal-normal-normal-mono-14-*-*-*-c-*-iso8859-1")
  ;; configure Chinese characters to align tables
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
					  charset (font-spec :family "NSimsun" :size 15))))



(provide 'init-fonts)
