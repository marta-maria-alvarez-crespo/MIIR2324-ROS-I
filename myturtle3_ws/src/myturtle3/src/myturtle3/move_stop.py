import rospy
import time
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from myturtle3.base import Base


class FindWall(Base):
    """
    This class represents a turtle behavior for finding a wall.

    It inherits from the Base class and implements methods for processing lidar scan data and 
    moving the turtle until it reaches a certain distance from a wall.

    Attributes:
        lidar_distances (list): A list to store the lidar distances.
        stop_distance (float): The distance from the wall at which the turtle should stop.
        speed (float): The linear velocity of the turtle.

    Methods:
        __init__(): Initializes the FindWall class.
        scan_callback(scan_message): Callback function for processing lidar scan data.
        move(): Moves the turtle forward until it reaches a certain distance from a wall.
        start(): Starts the movement of the turtle.
    """
    
    def __init__(self):
        """
        Initializes the FindWall class.
        """
        super().__init__()


    def scan_callback(self, scan_message):
        """
        Callback function for processing lidar scan data.

        Args:
            scan_message (LaserScan): The lidar scan message containing range data.

        Returns:
            None
        """
        self.lidar_distances = []
        self.lidar_distances.append(scan_message.ranges[0])
        self.lidar_distances = list(map(FindWall.set_inf_nan_value, self.lidar_distances))
        print(self.lidar_distances)


    def move(self):
        """
        Moves the turtle forward until it reaches a certain distance from a wall.

        This method sets the linear velocity of the turtle to a predefined speed and continuously 
        publishes the velocity command until the turtle is within the stop distance from an obstacle 
        detected by the lidar.

        Args:
            None

        Returns:
            None
        """
        twist = Twist()
        twist.angular.z = 0
        twist.linear.x = self.speed

        rospy.wait_for_message("scan", LaserScan)
        time.sleep(1)

        while self.lidar_distances[0] > self.stop_distance:
            self._cmd_pub.publish(twist)

        self.stop_turtle(topic="find_wall")


    def start(self):
        """
        Starts the movement of the turtle.
        """
        self.move()
