import rospy
import math
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from myturtle3.msg import StateMessage


class Base:
    """
    The Base class represents the base functionality of the turtle robot.
    It provides methods for controlling the turtle's movement and handling sensor data.
    """

    NO_OBSTACLE = 2.5

    def __init__(self):
        self._cmd_pub = rospy.Publisher("cmd_vel", Twist, queue_size=1)
        self._state_pub = rospy.Publisher("state", StateMessage, queue_size=1)
        self._laser_subscriber = rospy.Subscriber("scan", LaserScan, self.scan_callback)
        self.lidar_distances = []
        self.speed = 0.2
        self.stop_distance = 0.48
        
    @staticmethod
    def set_inf_nan_value(value):
        """
        Converts infinite or NaN values to predefined constants.

        Args:
            value: The value to be converted.

        Returns:
            The converted value. If the value is infinite, returns Base.NO_OBSTACLE.
            If the value is NaN, returns 0. Otherwise, returns the original value.
        """
        if value == float("Inf"):
            return Base.NO_OBSTACLE
        elif math.isnan(value):
            return 0
        else:
            return value
        
    def stop_turtle(self, topic):
        """
        Stops the turtle's movement and publishes a state message.

        Args:
            topic: The topic identifier for the state message.

        """
        twist = Twist()
        twist.linear.x = 0.0
        twist.angular.z = 0.0
        self._cmd_pub.publish(twist)

        message = StateMessage()
        message.id = topic
        message.state = True
        self._state_pub.publish(message)

        rospy.loginfo("Stop!")
        
    def scan_callback(self, scan_message):
        """
        Callback function for handling scan messages.

        Args:
            scan_message: The scan message received.

        Returns:
            None
        """
        pass
    