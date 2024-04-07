; Auto-generated. Do not edit!


(cl:in-package myturtle3-msg)


;//! \htmlinclude StateMessage.msg.html

(cl:defclass <StateMessage> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (state
    :reader state
    :initarg :state
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass StateMessage (<StateMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StateMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StateMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name myturtle3-msg:<StateMessage> is deprecated: use myturtle3-msg:StateMessage instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <StateMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myturtle3-msg:id-val is deprecated.  Use myturtle3-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <StateMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader myturtle3-msg:state-val is deprecated.  Use myturtle3-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StateMessage>) ostream)
  "Serializes a message object of type '<StateMessage>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'state) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StateMessage>) istream)
  "Deserializes a message object of type '<StateMessage>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'state) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StateMessage>)))
  "Returns string type for a message object of type '<StateMessage>"
  "myturtle3/StateMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StateMessage)))
  "Returns string type for a message object of type 'StateMessage"
  "myturtle3/StateMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StateMessage>)))
  "Returns md5sum for a message object of type '<StateMessage>"
  "ecda1d8727c3e57fb83dd5fb8a4c64b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StateMessage)))
  "Returns md5sum for a message object of type 'StateMessage"
  "ecda1d8727c3e57fb83dd5fb8a4c64b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StateMessage>)))
  "Returns full string definition for message of type '<StateMessage>"
  (cl:format cl:nil "string id~%bool state~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StateMessage)))
  "Returns full string definition for message of type 'StateMessage"
  (cl:format cl:nil "string id~%bool state~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StateMessage>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StateMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'StateMessage
    (cl:cons ':id (id msg))
    (cl:cons ':state (state msg))
))
