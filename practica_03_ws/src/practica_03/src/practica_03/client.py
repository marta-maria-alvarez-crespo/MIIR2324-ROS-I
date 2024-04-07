import rospy
from practica_03.srv import GetSensorValue

def solicitud(parametro):
    rospy.wait_for_service("sensor_info")
    try:
        sensor = rospy.ServiceProxy("sensor_info", GetSensorValue)
        respuesta = sensor(parametro)
        rospy.loginfo("El valor del sensor es " + str(respuesta.value))
    except rospy.ServiceException:
        rospy.logerr("Falló la llamada al servicio sensor_info")

def cliente():>
    opciones = {"temperatura" : 1, "humedad" : 2, "salir" :3}
    rospy.loginfo(f"\n============ Menú ============\n1 - Pedir valor de temperatura\n2 - Pedir valor de humedad\n3 - Salir\n==============================")
    seleccion = int(input("Selecciona una opción: "))
    while seleccion != opciones["salir"]:
        if seleccion == opciones["temperatura"]:
            solicitud("temperature")
        elif seleccion == opciones["humedad"]:
            solicitud("humidity")
        seleccion = int(input("Selecciona una opción: "))
    