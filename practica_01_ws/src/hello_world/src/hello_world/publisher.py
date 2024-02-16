import rospy
from std_msgs.msg import String

def publisher():
    pub = rospy.Publisher('/topic',String,queue_size=10)
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        message = 'Hello World ' + str(rospy.get_time())
        pub.publish(message)
        rate.sleep()
