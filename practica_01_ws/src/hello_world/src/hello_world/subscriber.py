import rospy
from std_msgs.msg import String

def SubCallback(data):
    rospy.loginfo(f'Me acaban de decir {data.data}')

def Subscriber():
    rospy.Subscriber('/topic',String,SubCallback)
    rospy.spin()
