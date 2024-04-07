
(cl:in-package :asdf)

(defsystem "myturtle3-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "StateMessage" :depends-on ("_package_StateMessage"))
    (:file "_package_StateMessage" :depends-on ("_package"))
  ))