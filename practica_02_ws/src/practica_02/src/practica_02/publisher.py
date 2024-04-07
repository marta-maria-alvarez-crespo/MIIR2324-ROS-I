import rospy
from practica_02.msg import SensorMessage
import random

def publisher():
    identifier = 1
    name = "sensor temp 02"
    pub = rospy.Publisher("sensortemp",SensorMessage, queue_size=10)
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        identifier = identifier + 1
        temperature = random.random()*50
        message = SensorMessage()
        message.id = identifier
        message.name = name
        message.temperature = temperature
        rospy.loginfo(message)
        pub.publish(message)
        rate.sleep()