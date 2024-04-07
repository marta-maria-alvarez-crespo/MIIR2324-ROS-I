import rospy
from practica_02.msg import SensorMessage


def subscriber_callback(data):
    """_summary_

    :param data: _description_
    :type data: _type_
    """
    rospy.loginfo(f"New sensor message received: {data.id}, {data.name}, {data.temperature}.")


def subscriber():
    """ """
    rospy.Subscriber("sensortemp", SensorMessage, subscriber_callback)
    rospy.spin()
