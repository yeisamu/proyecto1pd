from threading import Thread
from socket import socket,error
import funciones
import json
import time
import bd

Productos = []
validacion=''

class Cliente(Thread):
    '''funcion que genera hilos'''
    def __init__(self,conexion,direccion):
        Thread.__init__(self)
        self.conexion=conexion
        self.direccion=direccion

    def run(self):
        while True:

            if validacion == '':

                try:
                    recibido = self.conexion.recv(1024)
                    datoC = json.loads(recibido)
                    print datoC

                    valida = bd.Validar(datoC[0],datoC[1])

                    if valida == 1:
                        datos = '1'
                        self.conexion.send(datos)
                        intento='ok'
                    elif valida == 2:
                        datos = '2'
                        self.conexion.send(datos)
                        intento='ok'

                    else:
                        datos = '0'
                        self.conexion.send(datos)
                        intento='Fallo'

                    bd.Crear_log(datoC[0],intento,self.direccion[0])

                except error:
                    print ("[%s] Error de lectura" %self.name)
                    break

def main():
    server=socket()
    server.bind(("localhost", 35000))
    server.listen(1)
    while True:
        con,dire=server.accept()
        hilo = Cliente(con,dire)
        hilo.start()

if __name__ == '__main__':
    main()
