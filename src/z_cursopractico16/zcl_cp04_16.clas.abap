CLASS zcl_cp04_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cp04_16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   " * 1. ELIMINADA la definición local ty_reserva
   " * 2. Sustituidas todas las referencias ty_reserva → ZST_BOOKING_XX
   " * 3. Tabla interna usa ahora ZTT_BOOKINGS_XX
    DATA: lt_reservas   TYPE ztt_bookings_16,
          ls_reserva    TYPE zst_booking_16,
          lv_linea      TYPE string,
          lv_aerolinea  TYPE c LENGTH 2,
          lv_num_reservas TYPE i,
          lv_precio_total TYPE p LENGTH 8 DECIMALS 2,
          lv_precio_medio TYPE p LENGTH 8 DECIMALS 2,
          lv_num_str      TYPE string,
          lv_total_str    TYPE string,
          lv_medio_str    TYPE string.

 "   * Carga de datos iniciales
    ls_reserva = VALUE zst_booking_16( reserva_id = 1  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García'    fecha = '20260515' precio = '899.00'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 2  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López'  fecha = '20260515' precio = '120.00'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 3  aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith'    fecha = '20260520' precio = '450.50'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 4  aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez'   fecha = '20260520' precio = '310.75'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 5  aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Pedro Ruiz'    fecha = '20260515' precio = '120.00'  estado = 'C' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 6  aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan'      fecha = '20260601' precio = '1250.00' estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 7  aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Hans Müller'   fecha = '20260515' precio = '899.00'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 8  aerolinea = 'AA' num_vuelo = '0064' pasajero = 'Sarah Jones'   fecha = '20260525' precio = '510.00'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 9  aerolinea = 'IB' num_vuelo = '3950' pasajero = 'Elena Martín'  fecha = '20260601' precio = '275.30'  estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.
    ls_reserva = VALUE zst_booking_16( reserva_id = 10 aerolinea = 'LH' num_vuelo = '2030' pasajero = 'Franz Weber'   fecha = '20260610' precio = '95.00'   estado = 'A' ).
    APPEND ls_reserva TO lt_reservas.

  "  * Cabecera del informe
    out->write( '========================================================' ).
    out->write( 'INFORME DE RESERVAS ACTIVAS AGRUPADAS POR AEROLINEA'     ).
    out->write( '========================================================' ).
    out->write( 'Aerolinea | Num.Reservas | Precio Total | Precio Medio'  ).
    out->write( '========================================================' ).

   " * Agrupamos por aerolínea solo reservas activas
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

      lv_precio_medio = round( val = lv_precio_total / lv_num_reservas dec = 2 ).

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
