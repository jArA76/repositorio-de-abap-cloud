CLASS zcl_calculadora16_consola DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_calculadora16_consola IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  data lv_propietario type string.
  data lv_valor type i.

  data(lo_calculador) = new zcl_calculadora_16( i_valor = 0 i_nombre = 'Manolo' ).

  lo_calculador->get_nombre( importing o_nombre = lv_propietario ).
  lo_calculador->get_valor( importing o_valor = lv_valor ).

  out->write( |Calculadora de: { lv_propietario } con valor inicial: { lv_valor } | ).
"sumo 100
  lo_calculador->sumar( exporting i_valor = 100 ).
  lo_calculador->get_valor( importing o_valor = lv_valor ).
  out->write( |el valor en este momento es: { lv_valor } | ).

"multiplico por 3
  lo_calculador->multiplicar( exporting i_valor = 3 ).
  lo_calculador->get_valor( importing o_valor = lv_valor ).
  out->write( |el valor en este momento es: { lv_valor } | ).

  "resto 60
  lo_calculador->restar( exporting i_valor = 60 ).
  lo_calculador->get_valor( importing o_valor = lv_valor ).
  out->write( |el valor en este momento es: { lv_valor } | ).

  "divido entre 5
  lo_calculador->dividir( exporting i_valor = 5 ).
  lo_calculador->get_valor( importing o_valor = lv_valor ).
  out->write( |el valor en este momento es: { lv_valor } | ).

  "intento dividir entre 0

    data lv_error type abap_bool.
    lo_calculador->dividir( exporting i_valor = 0 importing rv_error = lv_error ).

    if lv_error = abap_true.
    out->write( |Error: Division por cero | ).
    endif.

    "reseteo
    lo_calculador->reset( ).
    lo_calculador->get_valor( importing o_valor = lv_valor ).
    out->write( |el valor en este momento es: { lv_valor } | ).

  ENDMETHOD.
ENDCLASS.
