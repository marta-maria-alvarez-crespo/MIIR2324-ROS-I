;; Auto-generated. Do not edit!


(when (boundp 'practica_03::GetSensorValue)
  (if (not (find-package "PRACTICA_03"))
    (make-package "PRACTICA_03"))
  (shadow 'GetSensorValue (find-package "PRACTICA_03")))
(unless (find-package "PRACTICA_03::GETSENSORVALUE")
  (make-package "PRACTICA_03::GETSENSORVALUE"))
(unless (find-package "PRACTICA_03::GETSENSORVALUEREQUEST")
  (make-package "PRACTICA_03::GETSENSORVALUEREQUEST"))
(unless (find-package "PRACTICA_03::GETSENSORVALUERESPONSE")
  (make-package "PRACTICA_03::GETSENSORVALUERESPONSE"))

(in-package "ROS")





(defclass practica_03::GetSensorValueRequest
  :super ros::object
  :slots (_name ))

(defmethod practica_03::GetSensorValueRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass practica_03::GetSensorValueResponse
  :super ros::object
  :slots (_value ))

(defmethod practica_03::GetSensorValueResponse
  (:init
   (&key
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _value (round __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; int8 _value
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _value
       (write-byte _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _value
     (setq _value (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _value 127) (setq _value (- _value 256)))
   ;;
   self)
  )

(defclass practica_03::GetSensorValue
  :super ros::object
  :slots ())

(setf (get practica_03::GetSensorValue :md5sum-) "bcd568b22b6f12ae3224ce5f80ba4ae1")
(setf (get practica_03::GetSensorValue :datatype-) "practica_03/GetSensorValue")
(setf (get practica_03::GetSensorValue :request) practica_03::GetSensorValueRequest)
(setf (get practica_03::GetSensorValue :response) practica_03::GetSensorValueResponse)

(defmethod practica_03::GetSensorValueRequest
  (:response () (instance practica_03::GetSensorValueResponse :init)))

(setf (get practica_03::GetSensorValueRequest :md5sum-) "bcd568b22b6f12ae3224ce5f80ba4ae1")
(setf (get practica_03::GetSensorValueRequest :datatype-) "practica_03/GetSensorValueRequest")
(setf (get practica_03::GetSensorValueRequest :definition-)
      "string name
---
int8 value
")

(setf (get practica_03::GetSensorValueResponse :md5sum-) "bcd568b22b6f12ae3224ce5f80ba4ae1")
(setf (get practica_03::GetSensorValueResponse :datatype-) "practica_03/GetSensorValueResponse")
(setf (get practica_03::GetSensorValueResponse :definition-)
      "string name
---
int8 value
")



(provide :practica_03/GetSensorValue "bcd568b22b6f12ae3224ce5f80ba4ae1")


