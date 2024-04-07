
(cl:in-package :asdf)

(defsystem "practica_02-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SensorMessage" :depends-on ("_package_SensorMessage"))
    (:file "_package_SensorMessage" :depends-on ("_package"))
  ))