# Autora: Marta María Álvarez Crespo
# Descripción: Clase TurnTurtle que representa el comportamiento de un robot tortuga para rotar ante un obstáculo.
# Última modificación: 07 / 04 / 2024

import rospy
import time
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from myturtle3.base import Base


class TurnTurtle(Base):
    """
    Una clase que representa el comportamiento de un robot tortuga para rotar ante un obstáculo.
    Esta clase hereda de la clase Base e implementa el comportamiento de rotación de la tortuga.
    """

    def __init__(self):
        """
        Inicializa la clase TurnTurtle.
        """
        super().__init__()

    def scan_callback(self, scan_message):
        """
        Callback para procesar los mensajes de escaneo del lidar.

        Args:
            scan_message (sensor_msgs.msg.LaserScan): El mensaje de escaneo conteniendo la información de distancia del LIDAR.

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
        Rota el turtlebot a la velocidad angular especificada.

        Args:
            angular_speed (float): La velocidad angular a la que se desea rotar el turtlebot.

        Returns:
            None
        """
        twist = Twist()
        twist.angular.z = angular_speed

        rospy.wait_for_message("scan", LaserScan)
        time.sleep(1)

        # Inicia la rotación de la tortuga a una velocidad de 1, siempre que la distancia del lidar lateral al obstáculo sea mayor a la distancia
        # de parada o la tortuga detecte un obstáculo en frente.
        while (self.lidar_distances[1] > self.stop_distance) or (self.lidar_distances[0] < self.stop_distance * 2.26):
            self._cmd_pub.publish(twist)

    def start(self):
        """
        Inicia la rotación de la tortuga y envía el flag correspondiente cuando termina.
        """
        self.rotate(1)
        self.stop_turtle("follow_wall")
