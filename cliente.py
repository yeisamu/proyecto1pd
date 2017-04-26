#!/usr/bin/env python
# -*- coding: utf-8 -*-

import socket
import funciones
import json
import bd

ruta_s= socket.socket()

#Conexión con el server
ruta_s.connect(("localhost",35000))

user_data   = []
login  = ''

while True: # mientras sea verdadero

    if login == '':
        User = raw_input("Ingrese Nombre de Usuario: ")
        user_data.append(User)

        password = raw_input("Digite Clave: ")

        user_data.append(password)

        paramsSend = json.dumps(user_data)

        ruta_s.send(paramsSend)
        user_data=[]
        datos = ruta_s.recv(1000)
        login = 'true'
    else:
        if datos == '1':
            print "Panel Administrador\n"
            datosok = funciones.menu()
            listamenu = funciones.menu_lista(datosok)

            opcion = raw_input("Seleccione una opción: ")
            # user_data.append(opcion)

            if opcion == 'a':
                print "Alertas"
                resp = bd.alertas_Productos()
                print resp

            if opcion == 'b':
                print "\n ******************* Inventarios ******************* \n"

                lista = funciones.menu_inventario()
                listamenu = funciones.menu_lista(lista)

                optmenu = raw_input("Seleccione una opción: ")
                #user_data.append(optmenu)

                if optmenu != '':
                    if optmenu == '1': # Ver Listado de Productos
                        resp = bd.Listar_Productos()
                        for regi in resp:
                            id = regi[0]
                            producto = regi[1]
                            descri = regi[2]
                            valuni = regi[3]
                            stock = regi[4]
                            # Imprimimos los resultados obtenidos
                            print "id=%s, Producto=%s, Descripcion=%s, valor uni=%s, inventario=%s" % (
                            id, producto, descri, valuni, stock)

                    if optmenu == '2':  # Agregar Nuevos Productos
                        resp = bd.Crear_Productos()
                        print resp

                    if optmenu == '3':  # Agregar Nuevos Productos
                        resp = bd.Actualizar_Productos()
                        print resp

                # nom=raw_input("Nombre de la pelicula: ")
                # user_data.append(nom)

            if opcion == 'c':
                print "\n ******************* Ventas ******************* \n"
                lista = funciones.menu_ventas()
                listamenu = funciones.menu_lista(lista)

                opcion = raw_input("Seleccione una opción: ")
                user_data.append(opcion)
                if optmenu != '':
                    if optmenu == '1': # Ver Listado de Productos
                        resp = bd.Listar_Productos()
                        print resp

                        #lista = funciones.menu_inventario()
                        #listamenu = funciones.menu_lista(lista)
                        #optmenu = raw_input("Seleccione una opción: ")

                    if optmenu == '2':  # Agregar Nuevos Productos
                        resp = bd.Crear_Productos()
                        print resp

                    if optmenu == '3':  # Agregar Nuevos Productos
                        resp = bd.Actualizar_Productos()
                        print resp

            if opcion == 'd':
                print "\n ******************* Usuarios ******************* \n"
                lista = funciones.menu_usuarios()
                listamenu = funciones.menu_lista(lista)

                optmenu = raw_input("Seleccione una opción: ")
                user_data.append(optmenu)
                if optmenu != '':
                    if optmenu == '7': # Ver Listado de usuarios
                        resp = bd.Listar_users()
                        print resp
                    if optmenu == '8':  # ver puntos
                        resp = bd.listar_Puntos()
                        print resp


            if opcion == 'e':
                print "\n ******************* Log de Usuarios ******************* \n"
                resp = bd.listar_Log()
                print resp
            if opcion == 'f':
                print "Registro de Usuarios"
                resp = bd.Crear_users()
                print resp
            if opcion == 'g':
                login = ''
                print "se ha cerrado el login"

                # ********************************************************************************

        elif datos == '2': # si el usuario es un cliente

            login = 'true'
            datok = funciones.menu_client()
            listamenu = funciones.menu_lista(datok)


            opcion = raw_input("Seleccione una opción: ")
            # user_data.append(opcion)

            if opcion == 'a':
                print "\n ******************* Hacer Mercado ******************* \n"

                lista = funciones.menu_mercado()
                listamenu = funciones.menu_lista(lista)

                optmenu = raw_input("Seleccione una opción: ")
                # user_data.append(optmenu)

                if optmenu == '1':  # Ver Listado de Productos
                    resp = bd.Listar_Productos()
                    for regi in resp:
                        id = regi[0]
                        producto = regi[1]
                        descri = regi[2]
                        valuni = regi[3]
                        stock = regi[4]
                        # Imprimimos los resultados obtenidos
                        print "id=%s, Producto=%s, Descripcion=%s, valor uni=%s, inventario=%s" % (
                            id, producto, descri, valuni, stock)

                if optmenu == '2':  # Ver Listado de Productos

                    while True:
                        resp = bd.Comprar_Productos(User)
                        print resp
                        op=raw_input('Ingresar otro producto ? (S/N)')
                        if(op=='s' or op=='S'):
                            resp = bd.Comprar_Productos(User)
                            print resp
                        else:
                            break

                if optmenu == '3':  # Generar Factura
                    resp = bd.Genera_factura(User)
                    print resp

                if optmenu == '4':  # Pagar
                    resp = bd.pagar(User)
                    print resp

            if opcion == 'b':
                print "\n ******************* Puntos ******************* \n"

                lista = funciones.menu_puntos()
                listamenu = funciones.menu_lista(lista)

                optmenu = raw_input("Seleccione una opción: ")
                # user_data.append(optmenu)

                if optmenu == '1':  # Ver puntos
                    resp = bd.Listar_Puntos(User)
                    for regi in resp:
                        pto = regi[0]
                    print "Puntos :%s" % (pto)

                if optmenu == '2':  # Cambiar puntos
                    resp = bd.CambiarPuntos(User)


            if opcion == 'c':

                print "\n ******************* Facturas ******************* \n"

                lista = funciones.menu_facturas()
                listamenu = funciones.menu_lista(lista)

                optmenu = raw_input("Seleccione una opción: ")
                # user_data.append(optmenu)

                if optmenu == '1':  # Ver Listado de Facturas

                    resp = bd.Listar_Facturas(User)

                    if resp:
                        for regi in resp:
                            id      = regi[0]
                            user    = regi[1]
                            total   = regi[2]
                            fecha_factura = regi[3]
                            # Imprimimos los resultados obtenidos
                            print "Factura No=%s,\n Total=%s,\n Fecha=%s" % (id, total, fecha_factura)
                    else:
                        print "No hay Facturas para este usuario"

                if optmenu == '2':  # Ver Detalle de Facturas

                    id = int(input("Ingrese ID de la Factura a Consultar: "))
                    resp = bd.Listar_Detalle_Fact(id,User)

                    for regi in resp:
                        prod        = regi[0]
                        desc        = regi[1]
                        cant        = regi[2]
                        val_unit    = regi[3]
                        total       = regi[4]
                        # Imprimimos los resultados obtenidos
                        print "Producto=%s,\n Descripción=%s,\n Cantidad=%s,\n Vlr Unit=%s,\n Total=%s" % (prod, desc, cant, val_unit, total)

            if opcion == 'd':
                print "\n ******************* Salir ******************* \n"
                login = ''
                print "se ha cerrado el login"

        elif datos == '0':
            print "Datos incorrectos"
            login = ''

#Termina la conexión
ruta_s.close()