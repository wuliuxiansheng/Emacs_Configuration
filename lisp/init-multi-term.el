;;; multi-term config

(require-package 'multi-term)

(require 'multi-term)

(setq multi-term-program "/bin/zsh")
(when *is-a-mac*
  (setq system-uses-terminfo nil)  ;; fix the display problem in Mac
  )
(setq multi-term-scroll-show-maximum-output t)  ;; show the maximum output when the window is scrolled

(global-set-key (kbd "C-x M") 'multi-term)

(provide 'init-multi-term)
