import rospy
from practica_03.srv import GetSensorValueResponse, GetSensorValue
import random


def handle_servicio(req):
    if req.name == "temperature":
        valor = int(random.random() * 45)
    elif req.name == "humidity":
        valor = int(random.random() * 100)
    rospy.loginfo(f"Extrayendo valor de {req.name}...")
    return GetSensorValueResponse(valor)


def servicio():
    rospy.Service("sensor_info", GetSensorValue, handle_servicio)
    rospy.spin()
