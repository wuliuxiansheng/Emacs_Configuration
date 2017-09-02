;; customized include user path
(defvar user-include-dirs-cpp
  '("." "./inc" "../inc" "../include" "../../../devel/include"
	"../../../../common/c/user/inc" "../../../../common/cpp/user/inc"
	"../../../../smores_common/c/inc" "../../../../smores_common/cpp/inc"
	"../../../../stm32/c/user/inc" "../../../../stm32/cpp/user/inc"
	"../../../../stm32f30x/c/user/inc" "../../../../stm32f30x/c/st/inc"
	"../../../../stm32f37x/c/user/inc" "../../../../stm32f37x/c/st/inc"
	))

(defvar user-include-dirs-c
  '("." "./inc" "../inc" "../include"))

(require 'company-c-headers)

;; add user path for searching c/c++ header files
;; combine two user include directories
(setq user-include-dirs (append user-include-dirs-cpp user-include-dirs-c))

;; (defvar system-include-dirs
;;   '("/opt/ros/indigo/include" "/usr/lib/gcc/avr/4.8.2/include" "/usr/lib/avr/include"))

(eval-after-load 'company-c-headers
  '(mapcar (lambda (item) (add-to-list 'company-c-headers-path-user item))
		   user-include-dirs))
;; (eval-after-load 'company-c-headers
;;   '(mapcar (lambda (item) (add-to-list 'company-c-headers-path-system item))
;; 		   system-include-dirs))
