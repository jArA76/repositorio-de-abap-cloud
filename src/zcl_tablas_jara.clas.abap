CLASS zcl_tablas_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas_jara IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA lt_number TYPE TABLE OF i.
*    APPEND 1 TO lt_number.
*    APPEND 2 TO lt_number.
*    APPEND 3 TO lt_number.
*    APPEND 4 TO lt_number.
*    APPEND 5 TO lt_number.
*    APPEND 6 TO lt_number.
*    APPEND 7 TO lt_number.
*    APPEND 8 TO lt_number.
*    APPEND 9 TO lt_number.
*    APPEND 10 TO lt_number.
*    APPEND 11 TO lt_number.
*    out->write( lt_number ).


"declaracion de variable tipo personalizada.
*TYPES: BEGIN OF ty_alumnos,
*             nombre TYPE string,
*             edad   TYPE i,
*             ciudad TYPE string,
*           END OF ty_ALUMNOS.
*
*    " Estructuras
*    DATA ls_alumnos TYPE ty_alumnos.
*
*    " Tablas
*    DATA: lt_alumnos TYPE TABLE OF ty_alumnos,
*          lt_alumnos_aux TYPE TABLE OF ty_alumnos.
*
*    ls_alumnos-nombre = 'Juan'.
*    ls_alumnos-edad = 23.
*    ls_alumnos-ciudad = 'Madrid'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Maria'.
*    ls_alumnos-edad = 25.
*    ls_alumnos-ciudad = 'Barcelona'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    ls_alumnos-nombre = 'Jorge'.
*    ls_alumnos-edad = 27.
*    ls_alumnos-ciudad = 'Valencia'.
*    APPEND ls_alumnos TO lt_alumnos.
*
*    LOOP AT lt_alumnos INTO ls_alumnos.
*      IF ls_alumnos-edad >= 25.
*        APPEND ls_alumnos TO lt_alumnos_aux.
*      ENDIF.
*    ENDLOOP.
*
*    out->write( lt_alumnos_aux ).

"otro ejercicio

*    DATA lt_vuelos TYPE TABLE OF /dmo/flight.
*    SELECT * FROM /dmo/flight INTO TABLE @lt_vuelos.
*    out->write( lt_vuelos ).
*
*DATA lt_vuelos TYPE TABLE OF /dmo/flight. "declaro variable tipo tabla
*data ls_vuelos type /dmo/flight. "declaro estructura tipo flight.
*
*SELECT * FROM /dmo/flight INTO TABLE @lt_vuelos.
*data lv_price type i.
*
*loop at lt_vuelos into ls_vuelos.
*lv_price = lv_price + ls_vuelos-price.
*endloop.
*
*out->write( | El importe total de todos los vuelos es:{ lv_price } | ).


"otra manera de hacerlo y mas cosas

*    DATA lt_vuelos TYPE TABLE OF /dmo/flight. " Declaración de tabla tipo FLIGHT
*    DATA ls_vuelos TYPE /dmo/flight.          " Declaración de estructura tipo FLIGHT
*    DATA lv_total TYPE /dmo/flight-price.       "declaro una variable del tipo de la tabla flight y el campo price.
*    "data lv_total type p leNGTH 16 deCIMALS 2.  "tambien se puede poner asi.
*    SELECT * FROM /dmo/flight WHERE carrier_id = 'AA' INTO TABLE @lt_vuelos.
*    "SELECT * FROM /dmo/flight INTO TABLE @lt_vuelos.
*
*       IF sy-subrc = 0. "si ha ido bien.
*      LOOP AT lt_vuelos INTO ls_vuelos. "recorreme la tabla lt_vuelos y lo que vaya saliendo que lo meta en la estructura ls_vuelo porque quiero recorrerla uno a uno, por eso pone
*      "la estructura porque solo puede almacenar un valor.
*        lv_total = lv_total + ls_vuelos-price.
*      ENDLOOP.
*      out->write( lt_vuelos ).
*      out->write( | La suma de todos los vuelos es { lv_total } | ).
*      else.
*      out->write( 'No existen vuelos' ).
*    ENDIF.


*SELECT SUM( price ) FROM /dmo/flight INTO @DATA(lv_acumulado). "acumula en una variable el resultado, es una declaracion en linea.
*    out->write( | El acumulado es { lv_acumulado } | ).
*
*    SELECT * FROM /dmo/agency INTO TABLE @DATA(lt_agencias). "acumula el resultado en una tabla declarada en linea.
*    IF sy-subrc = 0.
*
**      " Modo R3
**      READ TABLE lt_agencias INTO DATA(ls_agencia)
**          WITH KEY name = 'Bella Italia'.
**      IF sy-subrc = 0.
**        out->write( ls_agencia ).
**      ELSE.
**        out->write( 'La agencia no existe' ).
**      ENDIF.
*
*      " Modo S4
*      TRY.
*          DATA(ls_agencia) = lt_agencias[ postal_code = '01069' ]. "declaracion en linea de la variable ls_agencia.
*        CATCH cx_sy_itab_line_not_found.
*          out->write( 'La agencia no existe' ).
*      ENDTRY.
*      out->write( ls_agencia ).
*
*
*    ELSE.
*      out->write( 'No hay agencias' ).
*    ENDIF.
*
*    SELECT SINGLE * FROM /dmo/agency  "te devuelve solo el primer registro que encuentra, si hay
                                        "mas de uno solo muestra el primero
*        WHERE postal_code = '01069'
*        INTO @DATA(ls_agencia_2).
*    IF sy-subrc = 0.
*      out->write( | --------- | ).
*      out->write( ls_agencia ).
*    ENDIF.


  ENDMETHOD.

ENDCLASS.
