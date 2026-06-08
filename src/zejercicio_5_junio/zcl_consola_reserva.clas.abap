CLASS zcl_consola_reserva DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consola_reserva IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

    DATA lo_reserva  TYPE REF TO zcl_global.
    DATA lv_mensaje  TYPE string.
    DATA lt_reservas TYPE TABLE OF ztab_verano_16.
    DATA ls_reserva  TYPE ztab_verano_16.

    " ============================================================
    " Cambia este valor para probar cada funcionalidad:
    "   1 = Alta de reservas
    "   2 = Modificación de reserva
    "   3 = Consulta de una reserva concreta
    "   4 = Consulta de todas las reservas
    "   5 = Consulta de los primeros N registros
    " ============================================================
    DATA(lv_opcion) = 5.

    CASE lv_opcion.

      WHEN 1. " ---- ALTA DE RESERVAS ----

        " Reserva 1: Laura Sánchez
        lo_reserva = NEW zcl_global(
          i_nom_cli      = 'Laura'
          i_apellidos    = 'Sánchez'
          i_telef    = '600111222'
          i_diasactiv        = 3
          i_activicontrat = 2 ).
        lv_mensaje = lo_reserva->alta_reserva( ).
        out->write( lv_mensaje ).

        " Reserva 2: Manuel Pérez
        lo_reserva = NEW zcl_global(
          i_nom_cli      = 'Manuel'
          i_apellidos    = 'Pérez'
          i_telef    = '600333444'
          i_diasactiv        = 5
          i_activicontrat = 4 ).
        lv_mensaje = lo_reserva->alta_reserva( ).
        out->write( lv_mensaje ).

        " Reserva 3: Carmen Ruiz
        lo_reserva = NEW zcl_global(
          i_nom_cli      = 'Carmen'
          i_apellidos    = 'Ruiz'
          i_telef    = '600555666'
          i_diasactiv        = 2
          i_activicontrat = 1 ).
        lv_mensaje = lo_reserva->alta_reserva( ).
        out->write( lv_mensaje ).

      WHEN 2. " ---- MODIFICACIÓN DE RESERVA ----

        lo_reserva = NEW zcl_global(
          i_nom_cli      = ''
          i_apellidos    = ''
          i_telef    = ''
          i_diasactiv        = 0
          i_activicontrat = 0 ).

        lv_mensaje = lo_reserva->modif_reserva(
          i_reserva          = '000001'
          i_nom      = 'Laura'
          i_apell    = 'García'
          i_telef    = '600999888'
          i_numdiasacti        = 4
          i_numacticontra = 3 ).
        out->write( lv_mensaje ).

      WHEN 3. " ---- CONSULTA DE UNA RESERVA CONCRETA ----

        lo_reserva = NEW zcl_global(
          i_nom_cli      = ''
          i_apellidos    = ''
          i_telef    = ''
          i_diasactiv        = 0
          i_activicontrat = 0 ).

        lt_reservas = lo_reserva->cons_reserva( i_reserva = '2' ).

        LOOP AT lt_reservas INTO ls_reserva.
          out->write( |ID: { ls_reserva-id_reserva } | &&
                      |Nombre: { ls_reserva-nombre_cliente } | &&
                      |{ ls_reserva-apellido_cliente } | &&
                      |Tel: { ls_reserva-telefono } | &&
                      |Importe: { ls_reserva-importe_total }€| ).
        ENDLOOP.

      WHEN 4. " ---- CONSULTA DE TODAS LAS RESERVAS ----

        lo_reserva = NEW zcl_global(
          i_nom_cli      = ''
          i_apellidos    = ''
          i_telef    = ''
          i_diasactiv        = 0
          i_activicontrat = 0 ).

        lt_reservas = lo_reserva->cons_reserva( i_reserva = '0' ).

        LOOP AT lt_reservas INTO ls_reserva.
          out->write( |ID: { ls_reserva-id_reserva } | &&
                      |Nombre: { ls_reserva-nombre_cliente } | &&
                      |{ ls_reserva-apellido_cliente } | &&
                      |Tel: { ls_reserva-telefono } | &&
                      |Importe: { ls_reserva-importe_total }€| ).
        ENDLOOP.

      WHEN 5. " ---- CONSULTA DE LOS PRIMEROS N REGISTROS ----

    lo_reserva = NEW zcl_global(
          i_nom_cli      = ''
          i_apellidos    = ''
          i_telef    = ''
          i_diasactiv        = 0
          i_activicontrat = 0 ).

        lt_reservas = lo_reserva->cons_registros( i_cuantos = 3 ).

        LOOP AT lt_reservas INTO ls_reserva.
          out->write( |ID: { ls_reserva-id_reserva } | &&
                      |Nombre: { ls_reserva-nombre_cliente } | &&
                      |{ ls_reserva-apellido_cliente } | &&
                      |Tel: { ls_reserva-telefono } | &&
                      |Importe: { ls_reserva-importe_total }€| ).
        ENDLOOP.

    ENDCASE.

  ENDMETHOD.


ENDCLASS.
