import rospy
import time
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from myturtle3.base import Base


class FollowWall(Base):
    """
    A class representing a turtle robot that follows a wall.

    This class inherits from the Base class and implements the wall following behavior using a PID controller.

    Attributes:
        stop_distance_follow (float): The distance from the wall at which the turtle should stop.
        k (float): The proportional gain of the PID controller.
        ts (float): The sampling time of the PID controller.
        ti (float): The integral time constant of the PID controller.
        td (float): The derivative time constant of the PID controller.
        n (int): The filter coefficient of the derivative term.
        c1 (float): The coefficient for the integral term calculation.
        c2 (float): The coefficient for the derivative term calculation.
        c3 (float): The coefficient for the derivative term calculation.
        error (list): A list containing the current and previous error values.
        integral (list): A list containing the current and previous integral values.
        derivative (list): A list containing the current and previous derivative values.
        cur (int): The index of the current error, integral, and derivative values.
        pre (int): The index of the previous error, integral, and derivative values.
        lidar_distances (list): A list containing the lidar distances.

    Methods:
        __init__(): Initializes the FollowWall class.
        reset_pid(): Resets the PID controller.
        scan_callback(scan_message): Callback function for the scan message.
        pid(sp, speed): Calculates the control signal using a PID controller.
        move(): Moves the turtle robot forward while following a wall.
        start(): Starts the turtle movement and stops it after finding a wall.
    """

    def __init__(self):
        """
        Initializes the FollowWall class.

        This method sets up the initial values and parameters for the FollowWall class, including the PID parameters.

        Parameters:
        None

        Returns:
        None
        """
        super().__init__()
        self.stop_distance_follow = 0.38

        self.k = 1
        # sKelf.k = 0.6
        self.ts = 0.8
        self.ti = 1250000
        # self.ti = 500000
        self.td = 26
        self.n = 10

        self.c1 = self.ts / (2 * self.ti)
        self.c2 = (2 * self.td) / (2 * self.td / (self.n + self.ts))
        # self.c3 = (2 * self.Td / (self.N - self.Ts)) / (2 * self.Td / (self.N + self.Ts))
        # self.c2 = 0
        self.c3 = 0

        self.error = [0, 0]
        self.integral = [0, 0]
        self.derivative = [0, 0]

        self.cur, self.pre = 0, 1


    def reset_pid(self):
        """
        Resets the PID controller by setting the error, integral, and derivative terms to zero.
        """
        self.error = [0, 0]
        self.integral = [0, 0]
        self.derivative = [0, 0]


    def scan_callback(self, scan_message):
        """
        Callback function for the scan message.

        Args:
            scan_message (sensor_msgs.msg.LaserScan): The scan message containing the lidar distances.

        Returns:
            None
        """
        self.lidar_distances = []
        self.lidar_distances.append(scan_message.ranges[0])
        self.lidar_distances.append(scan_message.ranges[270])
        self.lidar_distances = list(map(FollowWall.set_inf_nan_value, self.lidar_distances))
        print(self.lidar_distances)


    def pid(self, sp, speed):
        """
        Calculates the control signal using a PID controller.

        Args:
            sp (float): Setpoint value.
            speed (float): Maximum speed value.

        Returns:
            float: Control signal calculated by the PID controller.
        """
        current_distance = self.lidar_distances[1]
        self.error[self.cur] = sp - current_distance

        # Ecuaciones correspondientes a un regulador PID discretizado
        self.integral[self.cur] = self.c1 * (self.error[self.cur] + self.error[self.pre]) + self.integral[self.pre]
        self.derivative[self.cur] = (
            self.c2 * (self.error[self.cur] - self.error[self.pre]) + self.c3 * self.derivative[self.pre]
        )
        self.error[self.pre] = self.error[self.cur]
        self.integral[self.pre] = self.integral[self.cur]
        self.derivative[self.pre] = self.derivative[self.cur]

        # Señal de control de velocidad
        cv = self.k * (self.error[self.cur] + self.integral[self.cur] + self.derivative[self.cur])

        if cv < (-speed * 2) or (cv > speed * 2):
            return cv * 2
        else:
            return cv


    def move(self):
        """
        Moves the turtle robot forward while following a wall.

        This method resets the PID controller, sets the linear velocity of the turtle,
        waits for a laser scan message, and then starts the wall following behavior.
        The turtle will continue moving forward until it reaches the stop distance
        from the wall.

        Args:
            None

        Returns:
            None
        """
        self.reset_pid()
        twist = Twist()
        twist.angular.z = 0
        twist.linear.x = self.speed

        rospy.wait_for_message("scan", LaserScan)
        time.sleep(1)

        while self.lidar_distances[0] > self.stop_distance:
            twist.angular.z = self.pid(self.stop_distance_follow, self.speed)
            self._cmd_pub.publish(twist)

        twist.angular.z = 0.0
        self._cmd_pub.publish(twist)


    def start(self):
        """
        Starts the turtle movement and stops it after finding a wall, sending a message to the state topic.
        """
        self.move()
        self.stop_turtle("find_wall")
