;;; Jedi customization

(setq jedi:server-args
      '("--sys-path" "/usr/local/lib/python2.7/dist-packages"
		"--sys-path" "/opt/ros/melodic/lib/python2.7/dist-packages"
        "--sys-path" "/home/chaoliu/Documents/tether-tube_robots_ros/src/ttr_control/scripts"
        "--sys-path" "/home/chaoliu/Documents/tether-tube_robots_ros/src/ttr_robot/scripts"
        "--sys-path" "/home/chaoliu/pyckbot/py"))
