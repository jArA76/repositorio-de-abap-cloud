CLASS z_agencia16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_agencia16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_reserva,
             id_reserva TYPE i,
             aerolinea  TYPE c LENGTH 2,
             num_vuelo  TYPE n LENGTH 4,
             pasajero   TYPE string,
             fecha      TYPE d,
             precio     TYPE p LENGTH 8 DECIMALS 2,
             estado     TYPE c LENGTH 1,
           END OF ty_reserva.


    DATA: lt_vuelos       TYPE TABLE OF zvuelos16,
          ls_vuelo        TYPE zvuelos16,
          lv_precio       TYPE p DECIMALS 2,
          lv_codigo       TYPE string,
          lv_destino_min  TYPE string,
          lv_longitud     TYPE i,
          lv_longitud_str TYPE string,
          lv_vuelo_str    TYPE string,
          lv_plazas_str   TYPE string,
          lv_linea        TYPE string,
          lv_precio_max   TYPE p DECIMALS 2,
          lv_precio_min   TYPE p DECIMALS 2,
          lv_precio_medio TYPE p DECIMALS 2,
          lv_total_plazas TYPE i,
          lv_max_str      TYPE string,
          lv_min_str      TYPE string,
          lv_medio_str    TYPE string,
          lv_suma         TYPE p DECIMALS 2,
          lv_precio_str   TYPE string,
          lv_categoria    TYPE string,
          lv_cuenta       TYPE i,
          lt_reservas     TYPE TABLE OF ty_reserva,
          ls_reserva      TYPE ty_reserva,
          lr_reserva      TYPE REF TO ty_reserva,
          lv_id_str       TYPE string,
          lv_eliminados   TYPE i,
          lv_elim_str     TYPE string,
          lv_pasajero     TYPE string,
          lv_aerolinea    TYPE c LENGTH 2,
          lv_num_reservas TYPE i,
          lv_precio_total TYPE p LENGTH 8 DECIMALS 2,
          lv_num_str      TYPE string,
          lv_total_str    TYPE string.



* "carga de datos
*
*
*    ls_vuelo-aerolinea    = 'LH'.
*    ls_vuelo-num_vuelo    = 400.
*    ls_vuelo-origen       = 'FRA'.
*    ls_vuelo-destino      = 'JFK'.
*    ls_vuelo-precio       = '899.00'.
*    ls_vuelo-plazas_libres = 15.
*    APPEND ls_vuelo TO lt_vuelos.
*
*
*    ls_vuelo-aerolinea    = 'AA'.
*    ls_vuelo-num_vuelo    = 17.
*    ls_vuelo-origen       = 'JFK'.
*    ls_vuelo-destino      = 'SFO'.
*    ls_vuelo-precio       = '450.50'.
*    ls_vuelo-plazas_libres = 0.
*    APPEND ls_vuelo TO lt_vuelos.
*
*
*    ls_vuelo-aerolinea    = 'IB'.
*    ls_vuelo-num_vuelo    = 3740.
*    ls_vuelo-origen       = 'MAD'.
*    ls_vuelo-destino      = 'BCN'.
*    ls_vuelo-precio       = '120.00'.
*    ls_vuelo-plazas_libres = 42.
*    APPEND ls_vuelo TO lt_vuelos.
*
*
*    ls_vuelo-aerolinea    = 'LH'.
*    ls_vuelo-num_vuelo    = 455.
*    ls_vuelo-origen       = 'FRA'.
*    ls_vuelo-destino      = 'MAD'.
*    ls_vuelo-precio       = '310.75'.
*    ls_vuelo-plazas_libres = 8.
*    APPEND ls_vuelo TO lt_vuelos.
*
*
*    ls_vuelo-aerolinea    = 'AA'.
*    ls_vuelo-num_vuelo    = 64.
*    ls_vuelo-origen       = 'SFO'.
*    ls_vuelo-destino      = 'JFK'.
*    ls_vuelo-precio       = '510.00'.
*    ls_vuelo-plazas_libres = 3.
*    APPEND ls_vuelo TO lt_vuelos.
*
*
*    ls_vuelo-aerolinea    = 'IB'.
*    ls_vuelo-num_vuelo    = 3950.
*    ls_vuelo-origen       = 'BCN'.
*    ls_vuelo-destino      = 'LHR'.
*    ls_vuelo-precio       = '275.30'.
*    ls_vuelo-plazas_libres = 0.
*    APPEND ls_vuelo TO lt_vuelos.
*
*
*    ls_vuelo-aerolinea    = 'LH'.
*    ls_vuelo-num_vuelo    = 2030.
*    ls_vuelo-origen       = 'MUC'.
*    ls_vuelo-destino      = 'FRA'.
*    ls_vuelo-precio       = '95.00'.
*    ls_vuelo-plazas_libres = 60.
*    APPEND ls_vuelo TO lt_vuelos.
*
*
*    ls_vuelo-aerolinea    = 'SQ'.
*    ls_vuelo-num_vuelo    = 26.
*    ls_vuelo-origen       = 'SIN'.
*    ls_vuelo-destino      = 'FRA'.
*    ls_vuelo-precio       = '1250.00'.
*    ls_vuelo-plazas_libres = 5.
*    APPEND ls_vuelo TO lt_vuelos.
*
*   INSERT Zvuelos16 FROM TABLE @lt_vuelos.

*"1.1 clasificacion de los vuelos por precio
*    SELECT * FROM zvuelos16 INTO TABLE @lt_vuelos.
*
*    IF sy-subrc <> 0.
*      out->write( 'No se encontraron vuelos.' ).
*      RETURN.
*    ENDIF.
*
*    LOOP AT lt_vuelos INTO ls_vuelo.
*
*
*      lv_precio     = ls_vuelo-precio.
*      lv_precio_str = ls_vuelo-precio.
*      lv_vuelo_str  = ls_vuelo-num_vuelo.
*
*   "Clasificación con expresión COND
*   lv_categoria = COND #(
*        WHEN lv_precio < 150                        THEN 'Economico'
*        WHEN lv_precio >= 150 AND lv_precio <= 500  THEN 'Estandar'
*        WHEN lv_precio > 500  AND lv_precio <= 1000 THEN 'Premium'
*        ELSE                                             'First Class'
*      ).
*
* CONCATENATE      ls_vuelo-aerolinea
*                  lv_vuelo_str
*                  ls_vuelo-origen
*                  ls_vuelo-destino
*                  lv_precio_str
*                  lv_categoria
*             INTO lv_linea SEPARATED BY ' | '.
*
*      out->write( lv_linea ).
*
*ENDLOOP.
*
*"ejercicio 1.2
*SELECT * FROM zvuelos16
*      WHERE  plazas_libres >  0
*        AND ( origen      =  'FRA' OR destino = 'FRA' )
*       "AND precio        <= '1000.00'
*       "comento precio porque lo tengo declarado como tipo char.
*       INTO TABLE @lt_vuelos.
*
*       IF sy-subrc <> 0.
*         out->write( 'No hay vuelos que cumplan los criterios.' ).
*         RETURN.
*       ENDIF.
*
*
*    out->write( '====================================================' ).
*    out->write( 'Aerolinea | Vuelo | Origen | Destino | Plazas | Precio' ).
*    out->write( '====================================================' ).
*
*    LOOP AT lt_vuelos INTO ls_vuelo.
*
*      lv_vuelo_str = ls_vuelo-num_vuelo.
*      lv_plazas_str = ls_vuelo-plazas_libres.
*      lv_precio     = ls_vuelo-precio.
*
*      CHECK lv_precio <= 1000. "lo hago asi porque el campo precio lo tengo declarado tipo char.
*      CONCATENATE ls_vuelo-aerolinea
*                  lv_vuelo_str
*                  ls_vuelo-origen
*                  ls_vuelo-destino
*                  lv_plazas_str
*                  ls_vuelo-precio
*             INTO lv_linea SEPARATED BY ' | '.
*
*      out->write( lv_linea ).
*
*    ENDLOOP.

*"ejercicio 1.3
* SELECT * FROM zvuelos16
*
*      WHERE
*        plazas_libres > 0
*        AND ( origen      = 'FRA' OR destino = 'FRA' )
*        INTO TABLE @lt_vuelos.
*
*    IF sy-subrc <> 0.
*      out->write( 'No hay vuelos que cumplan los criterios.' ).
*      RETURN.
*    ENDIF.
*
*    out->write( '=================================' ).
*    out->write( 'CODIGO | destino | longitud' ).
*    out->write( '=================================' ).
*
*    LOOP AT lt_vuelos INTO ls_vuelo.
*
*      lv_precio = ls_vuelo-precio.
*      CHECK lv_precio <= 1000.
*      lv_vuelo_str = ls_vuelo-num_vuelo.
*
*      CONCATENATE ls_vuelo-aerolinea '-' lv_vuelo_str INTO lv_codigo.
*
*
*      lv_destino_min = ls_vuelo-destino.
*      TRANSLATE lv_destino_min TO LOWER CASE.
*
*
*      lv_longitud     = strlen( lv_codigo ).
*      lv_longitud_str = lv_longitud.
*
*
*      CONCATENATE lv_codigo
*                  lv_destino_min
*                  lv_longitud_str
*             INTO lv_linea SEPARATED BY ' | '.
*
*      out->write( lv_linea ).
*
*    ENDLOOP.
*
**"ejercicio 1.4
* SELECT * FROM zvuelos16 INTO TABLE @lt_vuelos.
*
*
*    IF sy-subrc <> 0.
*      out->write( 'No hay vuelos.' ).
*      RETURN.
*    ENDIF.
*
*LOOP AT lt_vuelos INTO ls_vuelo.
*
*      lv_precio = ls_vuelo-precio.
*      lv_cuenta = lv_cuenta + 1.
*      lv_suma   = lv_suma + lv_precio.
*
*      " Precio máximo
*      IF lv_precio > lv_precio_max OR lv_cuenta = 1.
*        lv_precio_max = lv_precio.
*      ENDIF.
*
*      " Precio mínimo
*      IF lv_precio < lv_precio_min OR lv_cuenta = 1.
*        lv_precio_min = lv_precio.
*      ENDIF.
*
*      " Total plazas libres
*      lv_total_plazas = lv_total_plazas + ls_vuelo-plazas_libres.
*
*    ENDLOOP.
*
*    " Precio medio redondeado a 2 decimales
*    lv_precio_medio = round( val = lv_suma / lv_cuenta dec = 2 ).
*
*    " Convertimos a string para mostrar
*    lv_max_str    = lv_precio_max.
*    lv_min_str    = lv_precio_min.
*    lv_medio_str  = lv_precio_medio.
*    lv_plazas_str = lv_total_plazas.
*
*    " Mostramos resultados
*    out->write( '==============================' ).
*    out->write( 'RESUMEN DE VUELOS'             ).
*    out->write( '==============================' ).
*
*    CONCATENATE 'Precio maximo  :' lv_max_str    'EUR' INTO lv_linea SEPARATED BY ' '.
*    out->write( lv_linea ).
*
*    CONCATENATE 'Precio minimo  :' lv_min_str    'EUR' INTO lv_linea SEPARATED BY ' '.
*    out->write( lv_linea ).
*
*    CONCATENATE 'Precio medio   :' lv_medio_str  'EUR' INTO lv_linea SEPARATED BY ' '.
*    out->write( lv_linea ).
*
*    CONCATENATE 'Total plazas   :' lv_plazas_str       INTO lv_linea SEPARATED BY ' '.
*    out->write( lv_linea ).

*"CASO PRACTICO 2
*
*    " Carga de datos iniciales
*    ls_reserva = VALUE ty_reserva( id_reserva = 1  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García'    fecha = '20260515' precio = '899.00'  estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*
*    ls_reserva = VALUE ty_reserva( id_reserva = 2  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López'  fecha = '20260515' precio = '120.00'  estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*
*    ls_reserva = VALUE ty_reserva( id_reserva = 3  aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith'    fecha = '20260520' precio = '450.50'  estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*
*    ls_reserva = VALUE ty_reserva( id_reserva = 4  aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez'   fecha = '20260520' precio = '310.75'  estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*
*    ls_reserva = VALUE ty_reserva( id_reserva = 5  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Pedro Ruiz'    fecha = '20260515' precio = '120.00'  estado = 'C' ).
*    APPEND ls_reserva TO lt_reservas.
*
*    ls_reserva = VALUE ty_reserva( id_reserva = 6  aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan'      fecha = '20260601' precio = '1250.00' estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*
*    ls_reserva = VALUE ty_reserva( id_reserva = 7  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Hans Müller'   fecha = '20260515' precio = '899.00'  estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*
*    ls_reserva = VALUE ty_reserva( id_reserva = 8  aerolinea = 'AA' num_vuelo = '0064' pasajero = 'Sarah Jones'   fecha = '20260525' precio = '510.00'  estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*
*
*    out->write( '================================================================' ).
*    out->write( 'ID | Aerolinea | Vuelo | Pasajero | Fecha | Precio | Estado'     ).
*    out->write( '================================================================' ).
*
*    LOOP AT lt_reservas INTO ls_reserva.
*
*      lv_id_str     = ls_reserva-id_reserva.
*      lv_vuelo_str  = ls_reserva-num_vuelo.
*      lv_precio_str = ls_reserva-precio.
*
*      CONCATENATE lv_id_str
*                  ls_reserva-aerolinea
*                  lv_vuelo_str
*                  ls_reserva-pasajero
*                  ls_reserva-fecha
*                  lv_precio_str
*                  ls_reserva-estado
*             INTO lv_linea SEPARATED BY ' | '.
*
*      out->write( lv_linea ).
*
*    ENDLOOP.
*
*"ejercicio 2.1
***
*    ls_reserva = value ty_reserva( id_reserva = 9  aerolinea = 'IB' num_vuelo = '3950' pasajero = 'Elena Martín'  fecha = '20260601' precio = '275.30'  estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*    ls_reserva = VALUE ty_reserva( id_reserva = 10 aerolinea = 'LH' num_vuelo = '2030' pasajero = 'Franz Weber'   fecha = '20260610' precio = '95.00'   estado = 'A' ).
*    APPEND ls_reserva TO lt_reservas.
*
*    " Mostramos la tabla completa
*    out->write( '================================================================' ).
*    out->write( 'ID | Aerolinea | Vuelo | Pasajero | Fecha | Precio | Estado'     ).
*    out->write( '================================================================' ).
*
*    LOOP AT lt_reservas INTO ls_reserva.
*
*      lv_id_str     = ls_reserva-id_reserva.
*      lv_vuelo_str  = ls_reserva-num_vuelo.
*      lv_precio_str = ls_reserva-precio.
*
*      CONCATENATE lv_id_str
*                  ls_reserva-aerolinea
*                  lv_vuelo_str
*                  ls_reserva-pasajero
*                  ls_reserva-fecha
*                  lv_precio_str
*                  ls_reserva-estado
*             INTO lv_linea SEPARATED BY ' | '.
*
*      out->write( lv_linea ).
*    ENDLOOP.
*"ejercicio 2.2
    ls_reserva = VALUE ty_reserva( id_reserva = 1  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García'    fecha = '20260515' precio = '899.00'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.

    ls_reserva = VALUE ty_reserva( id_reserva = 2  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López'  fecha = '20260515' precio = '120.00'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.

    ls_reserva = VALUE ty_reserva( id_reserva = 3  aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith'    fecha = '20260520' precio = '450.50'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.

    ls_reserva = VALUE ty_reserva( id_reserva = 4  aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez'   fecha = '20260520' precio = '310.75'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.

    ls_reserva = VALUE ty_reserva( id_reserva = 5  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Pedro Ruiz'    fecha = '20260515' precio = '120.00'  estado = 'C' ).
    APPEND ls_reserva TO lt_reservas.

    ls_reserva = VALUE ty_reserva( id_reserva = 6  aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan'      fecha = '20260601' precio = '1250.00' estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.

    ls_reserva = VALUE ty_reserva( id_reserva = 7  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Hans Müller'   fecha = '20260515' precio = '899.00'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.

    ls_reserva = VALUE ty_reserva( id_reserva = 8  aerolinea = 'AA' num_vuelo = '0064' pasajero = 'Sarah Jones'   fecha = '20260525' precio = '510.00'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = value ty_reserva( id_reserva = 9  aerolinea = 'IB' num_vuelo = '3950' pasajero = 'Elena Martín'  fecha = '20260601' precio = '275.30'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE ty_reserva( id_reserva = 10 aerolinea = 'LH' num_vuelo = '2030' pasajero = 'Franz Weber'   fecha = '20260610' precio = '95.00'   estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
*
*        read table lt_reservas into ls_reserva with key id_reserva = 3.
*        IF sy-subrc = 0.
*          ls_reserva-precio = '480.00'.
*           MODIFY lt_reservas FROM ls_reserva INDEX sy-tabix.
*           out->write( '>>> Reserva ID 3 actualizada: precio cambiado a 480.00 EUR' ).
*        ENDIF.
*
*      out->write( '>>> Aplicando descuento 10% a reservas LH:' ).
*
*    LOOP AT lt_reservas INTO ls_reserva WHERE aerolinea = 'LH'.
*
*      ls_reserva-precio = ls_reserva-precio * '0.90'.
*      MODIFY lt_reservas FROM ls_reserva INDEX sy-tabix.
*
*      lv_id_str     = ls_reserva-id_reserva.
*      lv_precio_str = ls_reserva-precio.
*
*      CONCATENATE '    ID' lv_id_str '-' ls_reserva-pasajero
*                  ': nuevo precio ->' lv_precio_str 'EUR'
*             INTO lv_linea SEPARATED BY ' '.
*      out->write( lv_linea ).
*
*    ENDLOOP.
*
*    " Mostramos todos los registros modificados
*    out->write( ' ' ).
*    out->write( '================================================================' ).
*    out->write( 'ID | Aerolinea | Vuelo | Pasajero | Fecha | Precio | Estado'     ).
*    out->write( '================================================================' ).
*
*    LOOP AT lt_reservas INTO ls_reserva.
*
*      lv_id_str     = ls_reserva-id_reserva.
*      lv_vuelo_str  = ls_reserva-num_vuelo.
*      lv_precio_str = ls_reserva-precio.
*
*      CONCATENATE lv_id_str
*                  ls_reserva-aerolinea
*                  lv_vuelo_str
*                  ls_reserva-pasajero
*                  ls_reserva-fecha
*                  lv_precio_str
*                  ls_reserva-estado
*             INTO lv_linea SEPARATED BY ' | '.
*
*      out->write( lv_linea ).
*
*    ENDLOOP.

*"ejercicio 2.3
*READ TABLE lt_reservas INTO ls_reserva
*      WITH KEY id_reserva = 4.
*
*    IF sy-subrc = 0.
*      ls_reserva-estado = 'C'.
*      MODIFY lt_reservas FROM ls_reserva INDEX sy-tabix.
*      out->write( '>>> Reserva ID 4 cancelada.' ).
*    ENDIF.
*
*
*    LOOP AT lt_reservas INTO ls_reserva
*      WHERE estado = 'C'.
*      lv_eliminados = lv_eliminados + 1.
*    ENDLOOP.
*
*    DELETE lt_reservas WHERE estado = 'C'.
*
*    lv_elim_str = lv_eliminados.
*    CONCATENATE '>>> Registros eliminados:' lv_elim_str
*           INTO lv_linea SEPARATED BY ' '.
*    out->write( lv_linea ).
*
*
*    out->write( ' ' ).
*    out->write( '================================================================' ).
*    out->write( 'ID | Aerolinea | Vuelo | Pasajero | Fecha | Precio | Estado'     ).
*    out->write( '================================================================' ).
*
*    LOOP AT lt_reservas INTO ls_reserva.
*
*      lv_id_str     = ls_reserva-id_reserva.
*      lv_vuelo_str  = ls_reserva-num_vuelo.
*      lv_precio_str = ls_reserva-precio.
*
*      CONCATENATE lv_id_str
*                  ls_reserva-aerolinea
*                  lv_vuelo_str
*                  ls_reserva-pasajero
*                  ls_reserva-fecha
*                  lv_precio_str
*                  ls_reserva-estado
*             INTO lv_linea SEPARATED BY ' | '.
*
*      out->write( lv_linea ).
*
*    ENDLOOP.
"ejercicio 2.4
*    READ TABLE lt_reservas
*      WITH KEY pasajero = 'Lisa Tan'
*      TRANSPORTING NO FIELDS.
*
*    IF sy-subrc = 0.
*      out->write( '>>> Reserva encontrada para Lisa Tan.' ).
*    ELSE.
*      out->write( '>>> No existe reserva para Lisa Tan.' ).
*    ENDIF.
*
*    " 2. Referencia a la reserva con ID 6 (REFERENCE INTO)
*    out->write( ' ' ).
*    out->write( '=== 2. Busqueda con REFERENCE INTO ===' ).
*
*    READ TABLE lt_reservas
*      WITH KEY id_reserva = 6
*      REFERENCE INTO lr_reserva.
*
*    IF sy-subrc = 0.
*      lv_id_str     = lr_reserva->id_reserva.
*      lv_vuelo_str  = lr_reserva->num_vuelo.
*      lv_precio_str = lr_reserva->precio.
*
*      CONCATENATE lv_id_str
*                  lr_reserva->aerolinea
*                  lv_vuelo_str
*                  lr_reserva->pasajero
*                  lr_reserva->fecha
*                  lv_precio_str
*                  lr_reserva->estado
*             INTO lv_linea SEPARATED BY ' | '.
*
*      out->write( '>>> Datos de la reserva ID 6:' ).
*      out->write( lv_linea ).
*    ELSE.
*      out->write( '>>> No existe reserva con ID 6.' ).
*    ENDIF.
*
*    " 3. Acceso directo con expresión de tabla VALUE #( itab[ ... ] )
*    out->write( ' ' ).
*    out->write( '=== 3. Acceso con expresion de tabla ===' ).
*
*    lv_pasajero = VALUE #( lt_reservas[ id_reserva = 1 ]-pasajero OPTIONAL ).
*
*    IF lv_pasajero IS NOT INITIAL.
*      CONCATENATE '>>> Pasajero de la reserva ID 1:' lv_pasajero
*             INTO lv_linea SEPARATED BY ' '.
*      out->write( lv_linea ).
*    ELSE.
*      out->write( '>>> No existe reserva con ID 1.' ).
*    ENDIF.


*    "tarea 2.5
*
    LOOP AT lt_reservas INTO ls_reserva
      WHERE estado = 'A'
      GROUP BY ls_reserva-aerolinea
      ASCENDING
      ASSIGNING FIELD-SYMBOL(<grupo>).


      lv_num_reservas = 0.
      lv_precio_total = 0.


      LOOP AT GROUP <grupo> INTO ls_reserva.
        lv_num_reservas = lv_num_reservas + 1.
        lv_precio_total = lv_precio_total + ls_reserva-precio.
      ENDLOOP.

      " Calculamos precio medio
      lv_precio_medio = round( val = lv_precio_total / lv_num_reservas dec = 2 ).

      " Convertimos a string para mostrar
      lv_aerolinea = <grupo>.
      lv_num_str   = lv_num_reservas.
      lv_total_str = lv_precio_total.
      lv_medio_str = lv_precio_medio.

      CONCATENATE lv_aerolinea
                  lv_num_str
                  lv_total_str
                  lv_medio_str
             INTO lv_linea SEPARATED BY ' | '.

      out->write( lv_linea ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
