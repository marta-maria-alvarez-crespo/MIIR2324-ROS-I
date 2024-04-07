import rospy
import time
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from myturtle3.base import Base


class TurnTurtle(Base):

    def __init__(self):
        super().__init__()

    def scan_callback(self, scan_message):
        """
        Callback function for processing lidar scan messages.

        Args:
            scan_message (sensor_msgs.msg.LaserScan): The lidar scan message.

        Returns:
            None
        """
        self.lidar_distances = []
        self.lidar_distances.append(scan_message.ranges[0])
        self.lidar_distances.append(scan_message.ranges[270])
        self.lidar_distances = list(map(TurnTurtle.set_inf_nan_value, self.lidar_distances))
        print(self.lidar_distances)

    def rotate(self, angular_speed):
        """
        Rotates the turtlebot at the specified angular speed.

        Args:
            angular_speed (float): The angular speed of rotation in radians per second.

        Returns:
            None
        """
        twist = Twist()
        twist.angular.z = angular_speed

        rospy.wait_for_message("scan", LaserScan)
        time.sleep(1)

        while (self.lidar_distances[1] > self.stop_distance) or (self.lidar_distances[0] < self.stop_distance * 2.26):
            self._cmd_pub.publish(twist)

    def start(self):
        """
        Starts the turtle rotation and stops it after rotating by 1 unit.
        """
        self.rotate(1)
        self.stop_turtle("follow_wall")
