(require 'ispell)

;; check and correct spelling of the word at point or a region
(global-set-key (kbd "M-c") 'ispell-word)

(when (executable-find ispell-program-name)
  (require 'init-flyspell))

(provide 'init-spelling)
