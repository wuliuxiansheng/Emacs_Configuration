;;; Jedi customization

(setq jedi:server-args
      '("--sys-path-append" "/usr/local/lib/python2.7/dist-packages"
        "--sys-path-append" "/opt/ros/melodic/lib/python2.7/dist-packages"
        "--sys-path-append" "/home/chaoliu/Documents/tether-tube_robots_ros/src/ttr_control/scripts"
        "--sys-path-append" "/home/chaoliu/Documents/tether-tube_robots_ros/src/ttr_robot/scripts"
        "--sys-path-append" "/home/chaoliu/pyckbot/py"))


;; customization for jedi used by lsp
(with-eval-after-load 'lsp-mode
  (lsp-register-custom-settings '(("pylsp.plugins.jedi.extra_paths" ["/home/chaoliu/Documents/tether-tube_robots-vtt/src/tether-tube_robots/ttr_robot/scripts" "/home/chaoliu/Documents/tether-tube_robots-vtt/src/tether-tube_robots/ttr_control/scripts"]))))
