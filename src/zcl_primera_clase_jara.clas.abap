CLASS zcl_primera_clase_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_primera_clase_jara IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    out->write( 'hello juaN' ).
  ENDMETHOD.

ENDCLASS.
