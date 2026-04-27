CLASS zcl_bombilla_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bombilla_jara IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data(lo_bombilla) = new zcl_demo_bombilla( i_sitio = 'salon' i_estado = 'apagado' ).
  data estado type string.


   lo_bombilla->get_estado( importing o_estado = estado ).

  "out->write( lo_bombilla->get_estado( ) ).





  ENDMETHOD.
ENDCLASS.
