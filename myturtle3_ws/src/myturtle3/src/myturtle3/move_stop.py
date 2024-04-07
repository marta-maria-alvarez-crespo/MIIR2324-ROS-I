# Autora: Marta María Álvarez Crespo
# Descripción: Clase FindWall que representa un comportamiento de la tortuga para encontrar una pared.
# Última modificación: 07 / 04 / 2024

import rospy
import time
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from myturtle3.base import Base


class FindWall(Base):
    """
    Esta clase representa un comportamiento de la tortuga para encontrar una pared.
    Hereda de la clase Base e implementa métodos para procesar datos de escaneo de lidar y
    mover la tortuga hasta que alcance una cierta distancia de una pared.

    Attributes:
        lidar_distances (list): Una lista que almacena los valores de distancia del lidar.
        stop_distance (float): La distancia a la que la tortuga debe detenerse.
        speed (float): La velocidad de la tortuga.

    Methods:
        __init__(): Inicializa la clase FindWall.
        scan_callback(scan_message): Callback para procesar los datos de escaneo del lidar.
        move(): Mueve la tortuga hacia adelante hasta que alcance una pared a una cierta distancia.
        start(): Inicia el movimiento de la tortuga.
    """

    def __init__(self):
        """
        Inicializa la clase FindWall.
        """
        super().__init__()

    def scan_callback(self, scan_message):
        """
        Callback para procesar los datos de escaneo del lidar.

        Args:
            scan_message (LaserScan): El mensaje de escaneo que contiene la información de distancia del lidar.

        Returns:
            None
        """
        self.lidar_distances = []
        self.lidar_distances.append(scan_message.ranges[0])
        self.lidar_distances = list(map(FindWall.set_inf_nan_value, self.lidar_distances))
        print(self.lidar_distances)

    def move(self):
        """
        Mueve la tortuga hacia adelante hasta que alcance una pared a una cierta distancia.

        Este método establece la velocidad lineal de la tortuga a una velocidad predefinida y publica continuamente
        el comando de velocidad hasta que la tortuga esté dentro de la distancia de parada de un obstáculo
        detectado por el lidar.

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
        Inicia el movimiento de la tortuga.
        """
        self.move()
