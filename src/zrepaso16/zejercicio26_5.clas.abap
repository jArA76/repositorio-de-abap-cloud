CLASS zejercicio26_5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zejercicio26_5 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_vista TYPE TABLE OF zcds_flight_report_16.
    SELECT * FROM zcds_flight_report_16 ORDER by aerolinea, cone,fechvu INTO TABLE @lt_vista.
    out->write( lt_vista ).

  ENDMETHOD.
ENDCLASS.
