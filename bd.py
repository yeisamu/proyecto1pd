# -*- coding: utf-8 -*-
#!/usr/bin/python

import MySQLdb
import hashlib
import time
from datetime import datetime

DB_HOST = '127.0.0.1'
DB_USER = 'root'
DB_PASS = ''
DB_NAME = 'supermercado'

def run_query(query=''):
    datos = [DB_HOST, DB_USER, DB_PASS, DB_NAME]

    conn = MySQLdb.connect(*datos)  # Conectar a7 la base de datos
    cursor = conn.cursor()  # Crear un cursor
    cursor.execute(query)  # Ejecutar una consulta

    if query.upper().startswith('SELECT'):
        data = cursor.fetchall()  # Traer los resultados de un select
    else:
        conn.commit()  # Hacer efectiva la escritura de datos
        #data = None
        data = cursor.fetchall()  # Traer los resultados de un select

    cursor.close()  # Cerrar el cursor
    conn.close()  # Cerrar la conexión

    return data

def Validar(usuario,clave):

    #usuario = raw_input('Ingrese usuario: ')
    #clave = raw_input('Ingrese Clave: ')
    p=hashlib.new('md5',clave)
    passw=p.hexdigest()
    sql = "SELECT * FROM (usuarios AS U INNER JOIN tipo_usuario AS TU ON U.tipo_user = TU.id) WHERE email = '" + usuario + "' AND pass='" + passw + "'"
    result = run_query(sql)

    try:
        if result:
            #Validar si hay productos almacenados en el detalle y no se realizó la compra por parte del usuario
            sqlcon      = "SELECT * FROM detalle_compra_temp WHERE user = '" + usuario + "'"
            resultcon   = run_query(sqlcon)

            #si hay registros, se deben eliminar para permitir la compra de nuevos productos por parte del usuario
            if resultcon:
                sqldel      = "DELETE FROM detalle_compra_temp WHERE user = '" + usuario + "'"
                resultdel   = run_query(sqldel)

            for registro in result:
                #print registro[0],'->',registro[1]
                #print registro[5]
                datos = registro[4]
        else:
            datos = 0
    except:
        print "Error en Datos"

    #print datos
    return datos

def Crear_Productos():

    prod = raw_input('Ingrese Nombre del Producto: ')
    desc = raw_input('Ingrese Descripción del Producto: ')
    valor = raw_input('Ingrese Valor del Producto: ')
    stockmin = raw_input('Ingrese Cantidad Mínima del Producto: ')
    stock = raw_input('Ingrese inventario del Producto: ')

    sql = 'INSERT INTO productos (producto,descripcion,val_unit,stock,stock_minimo) VALUES ("%s","%s","%s","%s","%s")' % (prod, desc, valor, stock,stockmin)
    result = run_query(sql)

    sql = "SELECT * FROM productos WHERE id=(SELECT MAX( id ) FROM productos)"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No se Encontraron Productos Registrados'
    except:
        print "Error en Datos"

    # print datos
    return datos

def alertas_Productos():

    sql = "SELECT * FROM productos where stock < stock_minimo"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No Hay alerta de productos minimos'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Listar_Productos():

    sql = "SELECT * FROM productos where 1"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No se Encontraron Productos Registrados'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Actualizar_Productos():

    id = raw_input('Digite Código de Producto a Modificar: ')
    prod = raw_input('Ingrese Nombre del Producto: ')
    desc = raw_input('Ingrese Descripción del Producto: ')
    valor = raw_input('Ingrese Valor del Producto: ')
    stockmin = raw_input('Ingrese Cantidad Mínima del Producto: ')
    stock = raw_input('Ingrese inventario del Producto: ')

    #sql = 'UPDATE productos SET producto = "%s"' % prod % ',descripcion = "%s"' % desc % ',val_unit= "%s"' % valor % ',stock= "%s"' % stock % ' WHERE id = %i' % (int(id))
    sql = "UPDATE productos SET producto='%s',descripcion='%s',val_unit='%s',stock='%s',stock_minimo='%s' WHERE id = %i" % (prod,desc,valor,stock,stockmin, int(id))
    result = run_query(sql)

    sql = "SELECT * FROM productos WHERE id= %i" % (int(id))
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No se Encontraron Productos Registrados'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Comprar_Productos(iduser):

    hoy = time.strftime("%Y-%m-%d %H:%M:%S")
    resp = Listar_Productos()
    for regi in resp:
        id = regi[0]
        producto = regi[1]
        descri = regi[2]
        valuni = regi[3]
        stock = regi[4]
        # Imprimimos los resultados obtenidos
        print "id=%s, Producto=%s, Descripcion=%s, valor uni=%s, inventario=%s" % (id, producto, descri, valuni, stock)

    idprod  = int(raw_input('ID del Producto: '))
    cant    = int(raw_input('Cantidad: '))
    sql = "SELECT * FROM productos WHERE id= %i" % (int(idprod))
    resultado = run_query(sql)
    if resultado:
        for regi in resultado:
            cantidad = (regi[4])
            val_unit = int(regi[3])
        if(cant > cantidad):
            datos='No hay suficiente existencia'
        else:

            valpagar = int(val_unit * cant)
            sqlprod = 'INSERT INTO detalle_compra_temp (id_producto,cantidad,valor,user,fecha_registro) VALUES ("%s","%s","%s","%s","%s")' % (
            idprod, cant, valpagar, iduser, hoy)
            result = run_query(sqlprod)

            if result:
                nuevo_tot = cantidad - cant
                sqlprod = "UPDATE productos SET stock='%s' WHERE id = %i" % (nuevo_tot, int(idprod))
                result = run_query(sqlprod)

            datos="Producto agregado"
    else:
        datos ="Producto no existe"
    return datos

def Crear_users():

    hoy=time.strftime("%Y%m%d")
    usermail = raw_input('Ingrese Nombre del Usuario (correo electrónico): ')
    user = raw_input('Ingrese Nombre Completo: ')
    passw = raw_input('Ingrese password: ')
    tipo = raw_input('Ingrese tipo de usuario (1:Administrador, 2:Usuario): ')

    p = hashlib.new('md5', passw)
    contra = p.hexdigest()
    sql = 'INSERT INTO usuarios (email,pass,nombre,tipo_user,fecha_registro) VALUES ("%s","%s","%s","%s","%s")' % (usermail, contra, user, tipo,hoy)
    result = run_query(sql)

    sql = "SELECT * FROM usuarios WHERE id=(SELECT MAX( id ) FROM usuarios)"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No se Encontraron Productos Registrados'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Crear_log(usuario,intento,ip):
    hoy=time.strftime("%Y%m%d")
    hora=time.strftime("%H:%M:%S")

    sql = 'INSERT INTO logs (fecha_ingreso,usuario,intentos,ip,hora_ingreso) VALUES ("%s","%s","%s","%s","%s")' % (hoy, usuario, intento, ip,hora)
    result = run_query(sql)

def listar_Log():

    sql = "SELECT * FROM logs where 1"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No se Hay logs'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Listar_users():

    sql = "SELECT email,nombre,tipo FROM (usuarios AS U INNER JOIN tipo_usuario AS TU ON U.tipo_user = TU.id) where 1"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No se Hay usuarios'
    except:
        print "Error en Datos"

    # print datos
    return datos

def listar_Puntos():

    sql = "SELECT nombre,puntos FROM usuarios where puntos > 0"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No hay usuarios con puntos'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Listar_Puntos(usuario):

    sql = "SELECT puntos FROM usuarios where email='"+usuario+"'"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No tiene puntos'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Genera_factura(user):

    hoy = time.strftime("%Y-%m-%d %H:%M:%S")
    sql = "SELECT sum(valor) as total FROM detalle_compra_temp WHERE user='"+user+"'"
    resultado = run_query(sql)
    if(resultado):
        for regi in resultado:
            total = regi[0]
        if total >0 :
            sqlprod = 'INSERT INTO factura (user,total,fecha_factura) VALUES ("%s","%s","%s")' % (user, total, hoy)
            result = run_query(sqlprod)

            querynf = "SELECT MAX( id_fatura ) FROM factura"
            result3 = run_query(querynf)

            for resu in result3:
                idfact = resu[0]

            query2="insert into detalle_factura (id_producto,cantidad,valor,user,fecha_registro,id_factura) select id_producto,cantidad,valor,user,fecha_registro,%i " % (int(idfact))+ " from detalle_compra_temp where user='"+user+"'"
            result4 = run_query(query2)
            datos = "Factura Generada"
            deltemp="delete from  detalle_compra_temp where user='%s'" % user
            delresp=run_query(deltemp)

            selprod="select * from detalle_factura where id_factura=%i " % int(idfact)
            runsq=run_query(selprod)
            for prod in runsq:
                idprod = prod[1]
                cant = prod[2]
                seldp="select * from productos where id= %i" % int(idprod)
                runpd=run_query(seldp)
                for dprod in runpd:
                    cantold = dprod[4]
                ncant=cantold-cant
                actudeta="update productos set stock= %i where id=%i" % (ncant,idprod)
                runacp = run_query(actudeta)
        else:
            datos = "No hay compras pendientes"
    else:
        datos="No hay compras pendientes"
    return datos


def liquida_factura(usuario):

    sql = "SELECT MAX( id_fatura ) FROM factura where user='"+usuario+"'"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No tiene puntos'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Listar_Facturas(iduser):

    sql = "SELECT * FROM factura WHERE user='"+iduser+"'"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No se Encontraron Facturas'
    except:
        print "Error en Datos"

    # print datos
    return datos

def Listar_Detalle_Fact(id,iduser):

    sql = "SELECT p.producto, p.descripcion, df.cantidad, p.val_unit, df.valor FROM(detalle_factura as df INNER JOIN productos as p ON df.id_producto = p.id) WHERE df.user='"+iduser+"' AND df.id_factura=%i" % (int(id))
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No hay Detalle de Facturas'
    except:
        print "Error en Datos"

    # print datos
    return datos

def pagar(user):
    sql = "SELECT * FROM factura where user='" + user + "' and estado='sin_pagar'"
    resultado = run_query(sql)

    for regi in resultado:
        id = regi[0]
        val = regi[2]
        fecha = regi[3]
        # Imprimimos los resultados obtenidos
        print "id=%s, Valor=%s, fecha_factura=%s" % (id, val, fecha)

    nfact = int(raw_input('# factura apagar:'))

    resfact="select * from factura where id_fatura= %i" % (int(nfact))
    resfa=run_query(resfact)
    for regif in resfa:
        apagar = regif[2]
    print "Total a Pagar:"+ str(apagar)
    efect=int(raw_input("ingrese efectivo:"))
    if efect < apagar:
        dato=" pago incompleto -- falta efectivo "
    else:
        sql = "SELECT puntos FROM usuarios where email='" + user + "'"
        resultado = run_query(sql)
        if resultado:
            for resp in resultado:
                puntos = resp[0]
            ptos=(apagar/1000)+puntos
            upda="update usuarios set puntos=%s where email='%s'" % (ptos,user)
            run_query(upda)

            upda = "update factura set estado='liquidado' where id_fatura='%s'" % (nfact)
            run_query(upda)
            vueltas=efect-apagar
            if vueltas > 0:
                dato="Factura liquidada, devolucion : "+ str(vueltas)
            else:
                dato="Factura liquidada"

    return dato


def Listar_Productos_Puntos():

    sql = "SELECT * FROM premios WHERE 1"
    resultado = run_query(sql)

    try:
        if resultado:
            datos = resultado
        else:
            datos = 'No hay premios en este momento'
    except:
        print "Error en Datos"

    # print datos
    return datos

def CambiarPuntos(user):
    hoy = time.strftime("%Y%m%d")
    sql = "SELECT puntos FROM usuarios where email='" + user + "'"
    resultado = run_query(sql)
    if resultado:
        for resp in resultado:
            puntos = resp[0]

            if puntos == 0:
                print 'Usted no tiene puntos para cambiar'
            else:
                resp = Listar_Productos_Puntos()
                for regi in resp:
                    id = regi[0]
                    premio = regi[1]
                    puntosP = regi[2]

                    if puntos < puntosP:
                        Cambiar = 'NO'
                    else:
                        Cambiar = 'SI'

                    print "id=%s, Premio = %s, Puntos = %s, Cambiar = %s" % (id, premio, puntosP, Cambiar)

                idprod = int(input("Ingrese el Código del Premio a Cambiar: "))

                sqlP = "SELECT * FROM premios WHERE id= %i" % (idprod)
                result = run_query(sqlP)

                if result:
                    for resp in result:
                        puntosTot = resp[2]
                        producto = resp[1]

                    if puntosTot > puntos:
                        print "Usted no puede Cambiar los puntos por este premio, los puntos no son suficientes"
                    else:
                        TotPuntos = puntos - puntosTot
                        sqli = 'INSERT INTO premios_cambiados(idpremio,user,fecha) VALUES ("%s","%s","%s")' % (idprod, user, hoy)
                        resi = run_query(sqli)
                        actpuntos = "update usuarios set puntos='%s' where email='%s'" % (TotPuntos, user)
                        respact = run_query(actpuntos)
                        print "Puntos redimidos por premio "+ str(producto)
                else:
                    print "El código del premio no existe"




