# Autora: Marta María Álvarez Crespo
# Descripción: Clase Base que representa la funcionalidad base del robot tortuga.
# Última modificación: 07 / 04 / 2024

import rospy
import math
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from myturtle3.msg import StateMessage


class Base:
    """
    La clase Base representa la funcionalidad base del robot tortuga.
    Agrega métodos para controlar el movimiento de la tortuga y manejar los datos del sensor.
    """

    NO_OBSTACLE = 2.5

    def __init__(self):
        """
        Inicializa la clase Base.

        Esta función se encarga de inicializar los atributos y publicadores/subscriptores necesarios para
        el funcionamiento de la clase Base.

        Args:
            None

        Returns:
            None
        """
        self._cmd_pub = rospy.Publisher("cmd_vel", Twist, queue_size=1)
        self._state_pub = rospy.Publisher("state", StateMessage, queue_size=1)
        self._laser_subscriber = rospy.Subscriber("scan", LaserScan, self.scan_callback)
        self.lidar_distances = []
        self.speed = 0.2
        self.stop_distance = 0.48

    @staticmethod
    def set_inf_nan_value(value):
        """
        Convierte valores infinitos o NaN en constantes predefinidas.

        Args:
            value: El valor a ser convertido.

        Returns:
            El valor convertido. Si el valor es infinito, devuelve Base.NO_OBSTACLE.
            Si el valor es NaN, devuelve 0. De lo contrario, devuelve el valor original.
        """
        if value == float("Inf"):
            return Base.NO_OBSTACLE
        elif math.isnan(value):
            return 0
        else:
            return value

    def stop_turtle(self, topic):
        """
        Detiene el movimiento de la tortuga y publica un mensaje de estado.

        Args:
            topic: El identificador del mensaje del topic State.
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
        Callback para procesar los mensajes de escaneo del lidar.

        Args:
            scan_message: El mensaje de escaneo conteniendo la información de distancia del LIDAR.

        Returns:
            None
        """
