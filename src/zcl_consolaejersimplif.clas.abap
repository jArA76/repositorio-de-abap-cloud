CLASS zcl_consolaejersimplif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONSOLAEJERSIMPLIF IMPLEMENTATION.



  METHOD IF_OO_ADT_CLASSRUN~MAIN.


*SELECT FROM /lrn/passflight
*    FIELDS carrier_id, connection_id, flight_date
*     WHERE carrier_id    = 'LH' into table @DATA(datos).


select count(*) from /lrn/passflight where carrier_id = 'LH' into @data(lc).
     out->write( lc ).




  ENDMETHOD.

ENDCLASS.
