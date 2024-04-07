import rospy
import turtlesim
from geometry_msgs.msg import Twist, Pose

class TurtleMove():
    def __init__(self):
        self.turtle_pose = rospy.Subscriber("/turtle1/pose", Pose, self.turtle_pose_callback)
        self.turtle_move = rospy.Publisher("/turtle1/pose", Pose,queue_size=10)
    
    def turtle_pose_callback(self,data):
        self.current_x = data.x
        self.current_y = data.y
        if self.current_x <= self.target_x:
            twist = Twist()
            twist.linear.x = self.speed
            self.turtle_move.publish(twist)

    def move_straight(self, speed, distance):
        self.target_x = self.current_x + distance
        self.speed = speed

    def run(self):
        rospy.sleep(1)
        self.move_straight(3,9)
        rospy.spin()