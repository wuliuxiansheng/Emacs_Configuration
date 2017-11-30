(add-to-list 'load-path "/opt/ros/kinetic/share/emacs/site-lisp")

(require 'rosemacs-config)

;; (after-load 'rosemacs
;;   (after-load 'redshank
;;	(define-key redshank-mode-map (kbd "C-x C-r C-l") nil)))

(require-package 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; configure catkin_make command
(defun ros-catkin-make (dir)
  "Run catkin_make command in DIR."
  (interactive (list (read-directory-name "Directory: ")))
  (let* ((default-directory dir)
		 (compilation-buffer-name-function (lambda (major-mode-name) "*catkin_make*")))
	(compile "catkin_make"))
  )

(defun ros-catkin-make-json (dir)
  "Run catkin_make command in DIR."
  (interactive (list (read-directory-name "Directory: ")))
  (let* ((default-directory dir)
		 (compilation-buffer-name-function (lambda (major-mode-name) "*catkin_make*")))
	(compile "catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ."))
  )

(global-set-key (kbd "C-x C-r M") 'ros-catkin-make)
(global-set-key (kbd "C-x C-r C-j") 'ros-catkin-make-json)

(provide 'init-ros)
