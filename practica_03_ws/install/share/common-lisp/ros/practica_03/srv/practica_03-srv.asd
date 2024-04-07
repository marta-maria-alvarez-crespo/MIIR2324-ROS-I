
(cl:in-package :asdf)

(defsystem "practica_03-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetSensorValue" :depends-on ("_package_GetSensorValue"))
    (:file "_package_GetSensorValue" :depends-on ("_package"))
  ))