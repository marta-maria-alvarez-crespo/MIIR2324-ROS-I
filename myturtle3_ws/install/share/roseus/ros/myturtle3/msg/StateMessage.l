;; Auto-generated. Do not edit!


(when (boundp 'myturtle3::StateMessage)
  (if (not (find-package "MYTURTLE3"))
    (make-package "MYTURTLE3"))
  (shadow 'StateMessage (find-package "MYTURTLE3")))
(unless (find-package "MYTURTLE3::STATEMESSAGE")
  (make-package "MYTURTLE3::STATEMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude StateMessage.msg.html


(defclass myturtle3::StateMessage
  :super ros::object
  :slots (_id _state ))

(defmethod myturtle3::StateMessage
  (:init
   (&key
    ((:id __id) "")
    ((:state __state) nil)
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _state __state)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:state
   (&optional (__state :null))
   (if (not (eq __state :null)) (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; bool _state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; bool _state
       (if _state (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _state
     (setq _state (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get myturtle3::StateMessage :md5sum-) "ecda1d8727c3e57fb83dd5fb8a4c64b6")
(setf (get myturtle3::StateMessage :datatype-) "myturtle3/StateMessage")
(setf (get myturtle3::StateMessage :definition-)
      "string id
bool state
")



(provide :myturtle3/StateMessage "ecda1d8727c3e57fb83dd5fb8a4c64b6")


