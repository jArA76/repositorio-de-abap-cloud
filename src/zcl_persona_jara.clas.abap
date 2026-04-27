CLASS zcl_persona_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_persona_jara IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data(lo_cuenta) = new zcl_demo_persona( i_titular = 'carlos' i_saldo = 1000 ) . "declara una
                                        "variable en linea lo_cuenta.
    data lv_titular type string.
    data lv_saldo type i.
    DATA lv_valido TYPE abap_bool VALUE abap_true.


    lo_cuenta->get_titular( IMPORTING o_titular = lv_titular ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).

    out->write( |la cuenta de { lv_titular } tiene { lv_saldo }€ | ).

    lo_cuenta->ingresar( EXPORTING i_cantidad = 100 ).

    " Muestra la información
    lo_cuenta->get_titular( IMPORTING o_titular = lv_titular ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( | La cuenta de { lv_titular } tiene { lv_saldo }€ | ).

    lo_cuenta->retirar( EXPORTING i_cantidad = 500
                        IMPORTING o_valido = lv_valido ).
    IF lv_valido = abap_false.
      out->write( 'No hay suficiente saldo' ).
    ENDIF.

    " Muestra la información
    lo_cuenta->get_titular( IMPORTING o_titular = lv_titular ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( | La cuenta de { lv_titular } tiene { lv_saldo }€ | ).

    lo_cuenta->retirar( EXPORTING i_cantidad = 2000
                        IMPORTING o_valido = lv_valido  ).
    IF lv_valido = abap_false.
      out->write( 'No hay suficiente saldo' ).
    ENDIF.

    " Muestra la información
    lo_cuenta->get_titular( IMPORTING o_titular = lv_titular ).
    lo_cuenta->get_saldo( IMPORTING o_saldo = lv_saldo ).
    out->write( | La cuenta de { lv_titular } tiene { lv_saldo }€ | ).


  endmethod.
ENDCLASS.
