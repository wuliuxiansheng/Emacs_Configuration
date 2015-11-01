;;; multi-term config

(require-package 'multi-term)

(require 'multi-term)

(setq multi-term-program "/bin/zsh")
(when *is-a-mac*
  (setq system-uses-terminfo nil)  ;; fix the display problem in Mac
  )

(provide 'init-multi-term)
