import rospy
from practica_02.msg import SensorMessage

def subscriber_callback(data):
    rospy.loginfo(f"New sensor message received: {data.id}, {data.name}, {data.temperature}.")


def Subscriber():
    rospy.Subscriber("sensortemp",SensorMessage,subscriber_callback)
    rospy.spin()