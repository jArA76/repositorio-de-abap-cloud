CLASS zcl_relacion_tablas_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_relacion_tablas_16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "defino lo que necesito

    TYPES: BEGIN OF ty_agencia,

             name          TYPE /dmo/agency-name, "nombre de la agencia
             connection_id TYPE /dmo/booking-connection_id,
             flight_date   TYPE /dmo/booking-flight_date,
             flight_price  TYPE /dmo/booking-flight_price,

           END OF ty_ageNCIA.
    DATA ls_agencias TYPE ty_agencia.
    DATA ls_total TYPE TABLE OF ty_agencia.


    SELECT travel_id,connection_id,flight_date,
         flight_price FROM /dmo/booking INTO TABLE @DATA(lt_booking) UP TO 20 ROWS.

    IF sy-subrc = 0.
      out->write( 'la select ha ido bien' ).
    ENDIF.

    SELECT travel_id, agency_id FROM /dmo/travel INTO TABLE @DATA(lt_travel).

    SELECT agency_id, name FROM /dmo/agency INTO TABLE @DATA(lt_agency).

    LOOP AT lt_booking INTO DATA(ls_booking).


      READ TABLE lt_travel INTO DATA(ls_travel) WITH KEY travel_id = ls_booking-travel_id.
      IF sy-subrc = 0.

        READ TABLE lt_agency INTO DATA(ls_agency) WITH KEY agency_id = ls_travel-agency_id.
        "read table lt_agency into data(ls_nombre) with key agency_id = ls_travel-agency_id.
        IF sy-subrc = 0.

          ls_agencias = VALUE #( name = ls_agency-name
          connection_id = ls_booking-connection_id
          flight_date = ls_booking-flight_date
          flight_price = ls_booking-flight_price ).
          " out->write( ls_agency ).
          APPEND ls_agencias TO ls_total.

        ENDIF.



      ENDIF.

    ENDLOOP.
    out->write( ls_total ).




  ENDMETHOD.
ENDCLASS.
