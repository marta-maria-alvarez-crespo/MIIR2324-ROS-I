;; Auto-generated. Do not edit!


(when (boundp 'practica_02::SensorMessage)
  (if (not (find-package "PRACTICA_02"))
    (make-package "PRACTICA_02"))
  (shadow 'SensorMessage (find-package "PRACTICA_02")))
(unless (find-package "PRACTICA_02::SENSORMESSAGE")
  (make-package "PRACTICA_02::SENSORMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude SensorMessage.msg.html


(defclass practica_02::SensorMessage
  :super ros::object
  :slots (_id _name _temperature ))

(defmethod practica_02::SensorMessage
  (:init
   (&key
    ((:id __id) 0)
    ((:name __name) "")
    ((:temperature __temperature) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _name (string __name))
   (setq _temperature (float __temperature))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:temperature
   (&optional __temperature)
   (if __temperature (setq _temperature __temperature)) _temperature)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; string _name
    4 (length _name)
    ;; float32 _temperature
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _temperature
       (sys::poke _temperature (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _temperature
     (setq _temperature (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get practica_02::SensorMessage :md5sum-) "de8fe049e001b611ef86fe55ef6c3200")
(setf (get practica_02::SensorMessage :datatype-) "practica_02/SensorMessage")
(setf (get practica_02::SensorMessage :definition-)
      "int32 id
string name
float32 temperature
")



(provide :practica_02/SensorMessage "de8fe049e001b611ef86fe55ef6c3200")


