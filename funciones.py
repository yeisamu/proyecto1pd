# -*- coding: utf-8 -*-
import json

def menu():
    lista=['a. Alertas','b. Inventarios','c. Ventas','d. Usuarios','e. Log de Usuarios', 'f. Registro de Usuarios', 'g. Salir']
    cadena=json.dumps(lista)
    return cadena

def menu_lista(cadena):
    lista=json.loads(cadena)
    for i in lista:
        print i

def menu_client():
    lista=['a. Hacer Mercado','b. Puntos','c. Facturas','d. Salir']
    cadena=json.dumps(lista)
    return cadena

def menu_mercado():
    lista = ['1. Ver Listado de Productos', '2. Comprar Productos', '3. Generar Facturas', '4. Pagar']
    cadena=json.dumps(lista)
    return cadena

def menu_puntos():
    lista = ['1. Ver Puntos', '2. Cambiar Puntos por Productos']
    cadena=json.dumps(lista)
    return cadena

def menu_facturas():
    lista = ['1. Ver Listado de Facturas', '2. Detalles de las Facturas']
    cadena=json.dumps(lista)
    return cadena

def menu_inventario():
    lista=['1. Ver Listado de Productos','2. Agregar Nuevos Productos','3. Actualizar Productos']
    cadena=json.dumps(lista)
    return cadena

def menu_ventas():
    lista=['4. Ver Listado de Facturas','5. Ver detalle de Facturas','6. Ver Total de Ventas del Día']
    cadena=json.dumps(lista)
    return cadena

def menu_usuarios():
    lista=['7. Ver Listado de Usuarios','8. Ver Listado de Usuarios con Puntos']
    cadena=json.dumps(lista)
    return cadena

def cliente():
    lista = ['1. Hacer Mercado', '2. Puntos', '3. Facturas', '4. Salir']
    cadena = json.dumps(lista)
    return cadena