CLASS zcl_agencias_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_AGENCIAS_16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
"  Ejercicio de Reservas y Agencias

    TYPES: BEGIN OF ty_reservas,
             name          TYPE /dmo/agency-name,
             connection_id TYPE /dmo/booking-connection_id,
             flight_date   TYPE /dmo/booking-flight_date,
             flight_price  TYPE /dmo/booking-flight_price,
           END OF ty_reservas.

    DATA ls_reservas TYPE ty_reservas.
 "   DATA lt_reservas TYPE TABLE OF ty_reservas.
*
*    SELECT travel_id,
*           connection_id,
*           flight_date,
*           flight_price
*        FROM /dmo/booking
*        INTO TABLE @DATA(lt_booking) UP TO 10 ROWS.
*    IF sy-subrc = 0.
*
*      " Selección a Viajes
*      SELECT travel_id, agency_id FROM /dmo/travel
*          INTO TABLE @DATA(lt_travel).
*      IF sy-subrc = 0.
*
*        " Selección a Agencias
*        SELECT agency_id, name FROM /dmo/agency
*            INTO TABLE @DATA(lt_agency).
*        IF sy-subrc = 0.
*
*          LOOP AT lt_booking INTO DATA(ls_booking).
*
*            TRY.
*                DATA(ls_travel) = lt_travel[ travel_id = ls_booking-travel_id ].
*
*
*                DATA(ls_agency) = lt_agency[ agency_id = ls_travel-agency_id ].
*
*                ls_reservas = VALUE #( connection_id = ls_booking-connection_id
*                                  flight_date = ls_booking-flight_date
*                                  flight_price = ls_booking-flight_price
*                                  name = ls_agency-name ).
*
*                APPEND ls_reservas TO lt_reservas.
*
*              CATCH cx_sy_itab_line_not_found.
*                " No hace nada — si no encuentra, simplemente no añade
*            ENDTRY.
*
*          ENDLOOP.
*
*          out->write( lt_reservas ).
*
*        ENDIF.
*
*      ENDIF.
*
*    ENDIF.

    " Versión PRO

    SELECT
            connection_id,
            flight_date,
            flight_price,
            name

            FROM /dmo/booking AS b
                 JOIN /dmo/travel AS t
                    ON b~travel_id = t~travel_id
                 JOIN /dmo/agency AS a
                    ON t~agency_id = a~agency_id

            INTO TABLE @DATA(lt_reservas)
                UP TO 10 ROWS.

    IF sy-subrc = 0.
      out->write( lt_reservas ).
    ENDIF.


    " Versión PRO PRO

*    SELECT * FROM zcds_reserva
*        INTO TABLE @DATA(lt_reservas) UP TO 10 ROWS.
*    IF sy-subrc = 0.
*      out->write( lt_reservas ).
*    ENDIF.
*    SELECT * FROM ZCDS_FLIGHT_16
*        INTO TABLE @DATA(lt_reservas) UP TO 10 ROWS.
*    IF sy-subrc = 0.
*      out->write( lt_reservas ).
*    ENDIF.






  ENDMETHOD.
ENDCLASS.
