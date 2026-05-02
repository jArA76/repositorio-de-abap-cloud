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

            name type /dmo/agency-name, "nombre de la agencia
            connection_id type /dmo/booking-connection_id,
            flight_date type /dmo/booking-flight_date,
            flight_price type /dmo/booking-flight_price,

            end of ty_ageNCIA.
        data ls_agencias type ty_agencia.
        data ls_total type table of ty_agencia.

    select travel_id,connection_id,flight_date,
            flight_price from /dmo/booking into table @data(lt_booking) up to 20 rows.

    IF sy-subrc = 0.

    ENDIF.

    select travel_id, agency_id from /dmo/travel into table @data(lt_travel).

    select agency_id, name from /dmo/agency into table @data(lt_agency).

    loop at lt_booking into data(ls_booking).

      read table lt_travel into data(ls_travel) with key travel_id = ls_booking-travel_id.
      if sy-subrc = 0.

        read table lt_agency into data(ls_agency) with key agency_id = ls_travel-agency_id.
        "read table lt_agency into data(ls_nombre) with key agency_id = ls_travel-agency_id.
        if sy-subrc = 0.

        ls_agencias = value #( name = ls_agency-name
        connection_id = ls_booking-connection_id
        flight_date = ls_booking-flight_date
        flight_price = ls_booking-flight_price ).
       " out->write( ls_agency ).
        append ls_agencias to ls_total.

        endif.



        endif.

    endloop.
out->write( ls_total ).
  ENDMETHOD.
ENDCLASS.
