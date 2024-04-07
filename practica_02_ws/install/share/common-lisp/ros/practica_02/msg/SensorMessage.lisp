; Auto-generated. Do not edit!


(cl:in-package practica_02-msg)


;//! \htmlinclude SensorMessage.msg.html

(cl:defclass <SensorMessage> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (temperature
    :reader temperature
    :initarg :temperature
    :type cl:float
    :initform 0.0))
)

(cl:defclass SensorMessage (<SensorMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SensorMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SensorMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name practica_02-msg:<SensorMessage> is deprecated: use practica_02-msg:SensorMessage instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SensorMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader practica_02-msg:id-val is deprecated.  Use practica_02-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SensorMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader practica_02-msg:name-val is deprecated.  Use practica_02-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'temperature-val :lambda-list '(m))
(cl:defmethod temperature-val ((m <SensorMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader practica_02-msg:temperature-val is deprecated.  Use practica_02-msg:temperature instead.")
  (temperature m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SensorMessage>) ostream)
  "Serializes a message object of type '<SensorMessage>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'temperature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SensorMessage>) istream)
  "Deserializes a message object of type '<SensorMessage>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'temperature) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SensorMessage>)))
  "Returns string type for a message object of type '<SensorMessage>"
  "practica_02/SensorMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SensorMessage)))
  "Returns string type for a message object of type 'SensorMessage"
  "practica_02/SensorMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SensorMessage>)))
  "Returns md5sum for a message object of type '<SensorMessage>"
  "de8fe049e001b611ef86fe55ef6c3200")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SensorMessage)))
  "Returns md5sum for a message object of type 'SensorMessage"
  "de8fe049e001b611ef86fe55ef6c3200")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SensorMessage>)))
  "Returns full string definition for message of type '<SensorMessage>"
  (cl:format cl:nil "int32 id~%string name~%float32 temperature~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SensorMessage)))
  "Returns full string definition for message of type 'SensorMessage"
  (cl:format cl:nil "int32 id~%string name~%float32 temperature~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SensorMessage>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SensorMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'SensorMessage
    (cl:cons ':id (id msg))
    (cl:cons ':name (name msg))
    (cl:cons ':temperature (temperature msg))
))
