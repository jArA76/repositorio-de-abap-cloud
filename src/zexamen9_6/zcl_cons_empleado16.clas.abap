CLASS zcl_cons_empleado16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cons_empleado16 IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

    DATA lo_reserva  TYPE REF TO zcl_logicaempleado_16.
    DATA lv_mensaje  TYPE string.
    DATA lt_reservas TYPE TABLE OF ztab_usuario_ja.
    DATA ls_reserva  TYPE ztab_usuario_ja.


    DATA(lv_opcion) = 4.

    CASE lv_opcion.

      WHEN 1. " ---- ALTA DE empleado ----


        lo_reserva = NEW zcl_logicaempleado_16(
          i_nombre      = 'pedro'
          i_apellido    = 'picapiedra'
          i_tlf    = 60077125
          i_exp        = 9
          i_cert = 5 ).
        lv_mensaje = lo_reserva->realizar_alta( ).
        out->write( lv_mensaje ).


        lo_reserva = NEW zcl_logicaempleado_16(
          i_nombre      = 'manuel'
          i_apellido    = 'perez'
          i_tlf    = 6001125
          i_exp        = 8
          i_cert = 6 ).
        lv_mensaje = lo_reserva->realizar_alta( ).
        out->write( lv_mensaje ).



      WHEN 2. " ---- MODIFICACIÓN DE RESERVA ----

        lo_reserva = NEW zcl_logicaempleado_16(

          i_nombre      = ''
          i_apellido    = ''
          i_tlf   = ''
          i_exp        = 0
          i_cert = 0 ).

        lv_mensaje = lo_reserva->modif_emple(
          i_id          = 1
          i_nombre      = 'Laura'
          i_apellido    = 'García'
          i_tlf    = 600999888
          i_exp        = 4
          i_cert = 3 ).
        out->write( lv_mensaje ).

      WHEN 3. " ---- CONSULTA DE UNA RESERVA CONCRETA ----

        lo_reserva = NEW zcl_logicaempleado_16(
          i_nombre      = ''
          i_apellido    = ''
          i_tlf   = 0
          i_exp        = 0
          i_cert = 0 ).

        lt_reservas = lo_reserva->consulta_emp( i_id = '0' ).

        LOOP AT lt_reservas INTO ls_reserva.
          out->write( |ID: { ls_reserva-id_empleado } | &&
                      |Nombre: { ls_reserva-nombre } | &&
                      |{ ls_reserva-apellido } | &&
                      |Tel: { ls_reserva-telefono } | &&
                      |Importe: { ls_reserva-sueldo }€| ).
        ENDLOOP.

      WHEN 4. " consulta n registros.

     lo_reserva = NEW zcl_logicaempleado_16(
          i_nombre      = ''
          i_apellido    = ''
          i_tlf   = 0
          i_exp        = 0
          i_cert = 0 ).

        lt_reservas = lo_reserva->consulta_n( i_nregistros = '2' ).

        LOOP AT lt_reservas INTO ls_reserva.
          out->write( |ID: { ls_reserva-id_empleado } | &&
                      |Nombre: { ls_reserva-nombre } | &&
                      |{ ls_reserva-apellido } | &&
                      |Tel: { ls_reserva-telefono } | &&
                      |Importe: { ls_reserva-sueldo }€| ).
        ENDLOOP.



    ENDCASE.

  ENDMETHOD.


ENDCLASS.
