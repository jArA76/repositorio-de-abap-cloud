CLASS zcl_dw_test16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_dw_test16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " DATA(lo_dueno) = NEW zcl_dw_manager16( ).
     DATA lv_valido TYPE abap_bool.
     data ls_estruc type zdueno.
     data ls_estrucperro type zperros.
     data ls_estrucservicio type zservicios.
     data ls_valoracion type zvaloracion.
"crear dueño
*     ls_estruc = VALUE #(
*        id_dueno = 123456
*        nombre = 'LuisCa'
*        apellidos = 'Castillo'
*        telefono = '1231232'
*        email = 'LuisCa@gmail.com'
*        direccion = 'Mataroja 23'
*        ).
*
*    lo_dueno->creardueno(
*        EXPORTING
*            i_dueno = ls_estruc
*        IMPORTING
*            o_valido = lv_valido ).
*
*       if lv_valido = abap_true.
*         out->write( 'El dueño fue creado correctamente' ).
*       else.
*         out->write( 'El dueño no pudo ser creado' ).
*       endif.

""crear perro
*    DATA(lo_perro) = NEW zcl_dw_manager16( ).
*    ls_estrucperro = VALUE #(
*        id_perro = 123567
*        nombre = 'perro LuisCa'
*        raza = 'Doberman'
*        tamano = 'M'
*        fecha_nacimiento = '20220604'
*        notas_medicas = 'delicao del estormago'
*        id_dueno = 3 ).
*
*    lo_perro->creaperro( EXPORTING i_perro = ls_estrucperro imporTING o_valido = lv_valido ).
*
*    if lv_valido = abap_true.
*         out->write( 'El perro fue creado correctamente' ).
*       else.
*         out->write( 'El perro no pudo ser creado' ).
*       endif.

"crear servicio.
*  DATA(lo_servicios) = NEW zcl_dw_manager16( ).
*
*     ls_estrucservicio = VALUE #(
*        id_servicio = 1567
*        id_paseador = 3
*        id_perro = 123567
*        fecha_inicio = '20220604'
*        hora_inicio  = '120000'
*        fecha_fin    = '20220604'
*        hora_fin    = '124000'
*        estado    = 'CO'
*        tipo_servicio = 'GU'
*        precio_total  = 35
*        observaciones = 'el perro esta medio ciego' ).
*
*    lo_servicios->crearservicio( EXPORTING i_servicio = ls_estrucservicio impoRTING o_valido = lv_valido ).
*    if lv_valido = abap_true.
*         out->write( 'El servicio fue creado correctamente' ).
*       else.
*         out->write( 'El servicio no pudo ser creado' ).
*       endif.

"crear valoracion.
*   data(lo_valoracion) = new zcl_dw_manager16( ).
*
*      ls_valoracion = VALUE #(
*        id_valoracion = 1234567
*        id_servicio = 1567
*        puntuacion = 3
*        comentario = 'awesome'
*        fecha = '20220604' ).
*
*    lo_valoracion->crearvaloracion( EXPORTING i_valoracion = ls_valoracion impoRTING o_valido = lv_valido ).
*
*    if lv_valido = abap_true.
*         out->write( 'La valoracion fue creada correctamente' ).
*       else.
*         out->write( 'La valoracion no pudo ser creada' ).
*       endif.

"ver servicios paseador

*    data(lo_servpaseador) = new zcl_dw_manager16( ).
*    data lt_tablaserv type table of zservicios.
*
*    lo_servpaseador->get_servicios_paseador( EXPORTING i_id_paseador = 1 IMPORTING tablaserv = lt_tablaserv ).
*
*    out->write( lt_tablaserv ).

    "ver servicios perro
*    data(lo_servperros) = new zcl_dw_manager16( ).
*    data lt_tablaserv type table of zservicios.
*
*    lo_servperros->get_servicios_perros( EXPORTING i_id_perro = 1 IMPORTING tablaserv = lt_tablaserv ).
*
*    out->write( lt_tablaserv ).

"obtener media dado un id_paseador.

    data(lo_valoracion) = new zcl_dw_manager16( ).

      data lv_calculo type decfloat16.

    lo_valoracion->get_media_valoracion( EXPORTING i_id_paseador = 2 IMPORTING media = lv_calculo ).

    out->write( lv_calculo ).

  ENDMETHOD.
ENDCLASS.
