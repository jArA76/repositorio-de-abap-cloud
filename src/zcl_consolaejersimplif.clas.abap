CLASS zcl_consolaejersimplif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consolaejersimplif IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.


*SELECT FROM /lrn/passflight
*    FIELDS carrier_id, connection_id, flight_date
*     WHERE carrier_id    = 'LH' into table @DATA(datos).


    SELECT COUNT(*) FROM /lrn/passflight WHERE carrier_id = 'LH' INTO @DATA(lc).
    out->write( lc ).




  ENDMETHOD.

ENDCLASS.
