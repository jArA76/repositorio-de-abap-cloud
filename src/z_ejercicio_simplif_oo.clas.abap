CLASS Z_EJERCICIO_SIMPLIF_OO DEFINITION
PUBLIC
FINAL
CREATE
PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS Z_EJERCICIO_SIMPLIF_OO IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


    DATA(carrier) = NEW lcl_carrier( 'LH' ).

    out->write( carrier->get_output( ) ).

    DATA(today) = cl_abap_context_info=>get_system_date(  ).

* Passenger
    carrier->find_passenger_flight(
      EXPORTING
        i_airport_from_id = 'FRA'
        i_airport_to_id   = 'JFK'
        i_from_date       = today
        i_seats           = 5
      IMPORTING
        e_flight     = DATA(pf)
        e_days_later = DATA(days1)
    ).

    IF pf IS BOUND.
      out->write( |Passenger in { days1 } days| ).
      out->write( pf->get_description( ) ).
    ENDIF.

* Cargo
    carrier->find_cargo_flight(
      EXPORTING
        i_airport_from_id = 'FRA'
        i_airport_to_id   = 'JFK'
        i_from_date       = today
        i_cargo           = 1000
      IMPORTING
        e_flight     = DATA(cf)
        e_days_later = DATA(days2)
    ).

    IF cf IS BOUND.
      out->write( |Cargo in { days2 } days| ).
      out->write( cf->get_description( ) ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

