# Autora: Marta María Álvarez Crespo
# Descripción: Clase FollowWall que representa el comportamiento de un robot tortuga para seguir una pared usando un controlador PID.
# Última modificación: 07 / 04 / 2024

import rospy
import time
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from myturtle3.base import Base


class FollowWall(Base):
    """
    Una clase que representa el comportamiento de un robot tortuga para seguir una pared.
    Esta clase hereda de la clase Base e implementa el comportamiento de seguimiento de pared usando un controlador PID.

    Atributes:
        stop_distance_follow (float): La distancia desde la pared a la que la tortuga debe detenerse.
        k (float): La ganancia proporcional del controlador PID.
        ts (float): El tiempo de muestreo del controlador PID.
        ti (float): El tiempo constante integral del controlador PID.
        td (float): El tiempo constante derivativo del controlador PID.
        n (int): El coeficiente de filtro de paso bajo del término derivativo.
        c1 (float): El coeficiente para el cálculo del término integral.
        c2 (float): El coeficiente para el cálculo del término derivativo.
        c3 (float): El coeficiente para el cálculo del término derivativo.
        error (list): Una lista que contiene los valores de error actuales y anteriores.
        integral (list): Una lista que contiene los valores integrales actuales y anteriores.
        derivative (list): Una lista que contiene los valores derivativos actuales y anteriores.
        cur (int): El índice de los valores actuales de error, integral y derivativo.
        pre (int): El índice de los valores anteriores de error, integral y derivativo.

    Methods:
        __init__(): Inicializa la clase FollowWall.
        reset_pid(): Restablece el controlador PID para que el error parta de 0 en cada iteración.
        scan_callback(scan_message): Función de devolución de llamada para el mensaje de escaneo.
        pid(sp, speed): Calcula la señal de control usando un controlador PID.
        move(): Mueve el robot tortuga hacia adelante mientras sigue una pared.
        start(): Inicia el movimiento de la tortuga y lo detiene después de encontrar una pared.
    """

    def __init__(self):
        """
        Inicializa la clase FollowWall.
        Este método establece los valores y parámetros iniciales para la clase FollowWall, incluyendo los parámetros del PID.

        Parameters:
        None

        Returns:
        None
        """
        super().__init__()
        self.stop_distance_follow = 0.38

        self.k = 1
        # self.k = 0.6
        self.ts = 0.8
        self.ti = 1250000
        # self.ti = 500000
        self.td = 26
        self.n = 10

        self.c1 = self.ts / (2 * self.ti)
        self.c2 = (2 * self.td) / (2 * self.td / (self.n + self.ts))
        self.c3 = (2 * self.td / (self.n - self.ts)) / (2 * self.td / (self.n + self.ts))
        # self.c2 = 0
        self.c3 = 0

        self.error = [0, 0]
        self.integral = [0, 0]
        self.derivative = [0, 0]

        self.cur, self.pre = 0, 1

    def reset_pid(self):
        """
        Resetea el controlador PID estableciendo los términos de error, integral y derivativo a cero.
        """
        self.error = [0, 0]
        self.integral = [0, 0]
        self.derivative = [0, 0]

    def scan_callback(self, scan_message):
        """
        Callback para el mensaje de escaneo.

        Args:
            scan_message (sensor_msgs.msg.LaserScan): El mensaje de escaneo conteniendo la información de distancia del LIDAR.

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
        Calcula la señal de control usando un controlador PID.

        Args:
            sp (float): Valor del setpoint o consigna del controlador PID.
            speed (float): Valor de velocidad máxima de la tortuga.

        Returns:
            float: Señal de control calculada por el controlador PID.
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
        Mueve la tortuga hacia adelante mientras sigue una pared.

        Este método restablece el controlador PID, establece la velocidad lineal de la tortuga,
        espera un mensaje de escaneo láser y luego inicia el comportamiento de seguimiento de pared.
        La tortuga continuará moviéndose hacia adelante hasta que alcance la distancia de parada
        desde la pared.

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
        Comienza el movimiento de la tortuga y la detiene después de encontrar una pared, enviando un mensaje al topic de state.
        """
        self.move()
        self.stop_turtle("turn_wall")
