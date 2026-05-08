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

     DATA(lo_dueno) = NEW zcl_dw_manager16( ).
     DATA lv_valido TYPE abap_bool.
     data ls_estruc type zdueno.

     ls_estruc = VALUE #(
        id_dueno = 123456
        nombre = 'LuisCa'
        apellidos = 'Castillo'
        telefono = '1231232'
        email = 'LuisCa@gmail.com'
        direccion = 'Mataroja 23'
        ).

    lo_dueno->creardueno(
        EXPORTING
            i_dueno = ls_estruc
        IMPORTING
            o_valido = lv_valido ).

       if lv_valido = abap_true.
         out->write( 'El dueño fue creado correctamente' ).
       else.
         out->write( 'El dueño no pudo ser creado' ).
       endif.



  ENDMETHOD.
ENDCLASS.
