; Auto-generated. Do not edit!


(cl:in-package practica_03-srv)


;//! \htmlinclude GetSensorValue-request.msg.html

(cl:defclass <GetSensorValue-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass GetSensorValue-request (<GetSensorValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSensorValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSensorValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name practica_03-srv:<GetSensorValue-request> is deprecated: use practica_03-srv:GetSensorValue-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <GetSensorValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader practica_03-srv:name-val is deprecated.  Use practica_03-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSensorValue-request>) ostream)
  "Serializes a message object of type '<GetSensorValue-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSensorValue-request>) istream)
  "Deserializes a message object of type '<GetSensorValue-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSensorValue-request>)))
  "Returns string type for a service object of type '<GetSensorValue-request>"
  "practica_03/GetSensorValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSensorValue-request)))
  "Returns string type for a service object of type 'GetSensorValue-request"
  "practica_03/GetSensorValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSensorValue-request>)))
  "Returns md5sum for a message object of type '<GetSensorValue-request>"
  "bcd568b22b6f12ae3224ce5f80ba4ae1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSensorValue-request)))
  "Returns md5sum for a message object of type 'GetSensorValue-request"
  "bcd568b22b6f12ae3224ce5f80ba4ae1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSensorValue-request>)))
  "Returns full string definition for message of type '<GetSensorValue-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSensorValue-request)))
  "Returns full string definition for message of type 'GetSensorValue-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSensorValue-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSensorValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSensorValue-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude GetSensorValue-response.msg.html

(cl:defclass <GetSensorValue-response> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GetSensorValue-response (<GetSensorValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSensorValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSensorValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name practica_03-srv:<GetSensorValue-response> is deprecated: use practica_03-srv:GetSensorValue-response instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <GetSensorValue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader practica_03-srv:value-val is deprecated.  Use practica_03-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSensorValue-response>) ostream)
  "Serializes a message object of type '<GetSensorValue-response>"
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSensorValue-response>) istream)
  "Deserializes a message object of type '<GetSensorValue-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSensorValue-response>)))
  "Returns string type for a service object of type '<GetSensorValue-response>"
  "practica_03/GetSensorValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSensorValue-response)))
  "Returns string type for a service object of type 'GetSensorValue-response"
  "practica_03/GetSensorValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSensorValue-response>)))
  "Returns md5sum for a message object of type '<GetSensorValue-response>"
  "bcd568b22b6f12ae3224ce5f80ba4ae1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSensorValue-response)))
  "Returns md5sum for a message object of type 'GetSensorValue-response"
  "bcd568b22b6f12ae3224ce5f80ba4ae1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSensorValue-response>)))
  "Returns full string definition for message of type '<GetSensorValue-response>"
  (cl:format cl:nil "int8 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSensorValue-response)))
  "Returns full string definition for message of type 'GetSensorValue-response"
  (cl:format cl:nil "int8 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSensorValue-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSensorValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSensorValue-response
    (cl:cons ':value (value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetSensorValue)))
  'GetSensorValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetSensorValue)))
  'GetSensorValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSensorValue)))
  "Returns string type for a service object of type '<GetSensorValue>"
  "practica_03/GetSensorValue")