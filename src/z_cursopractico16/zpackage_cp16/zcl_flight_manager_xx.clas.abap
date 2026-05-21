CLASS zcl_flight_manager_xx DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_flight_manager_xx.

    METHODS constructor
      IMPORTING
        it_flights TYPE zif_flight_manager_xx=>tt_flights OPTIONAL.

  PRIVATE SECTION.
    DATA mt_flights TYPE zif_flight_manager_xx=>tt_flights.

ENDCLASS.

CLASS zcl_flight_manager_xx IMPLEMENTATION.

  METHOD constructor.
    IF it_flights IS SUPPLIED.
      mt_flights = it_flights.
    ENDIF.
  ENDMETHOD.

  METHOD zif_flight_manager_xx~add_flight.
    " Validar precio positivo
    IF is_flight-price <= 0.
      RAISE EXCEPTION TYPE zcx_flight_error_xx
        EXPORTING
          iv_message = |El precio del vuelo { is_flight-airline }{ is_flight-flightnum } debe ser positivo|.
    ENDIF.

    " Validar duplicado
    READ TABLE mt_flights
      WITH KEY airline   = is_flight-airline
               flightnum = is_flight-flightnum
      TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      RAISE EXCEPTION TYPE zcx_flight_error_xx
        EXPORTING
          iv_message = |Vuelo duplicado: { is_flight-airline }{ is_flight-flightnum }|.
    ENDIF.

    APPEND is_flight TO mt_flights.
  ENDMETHOD.

  METHOD zif_flight_manager_xx~get_flights_by_airline.
  rt_flights = VALUE #( FOR flight IN mt_flights
                        WHERE ( airline = iv_airline )
                        ( flight ) ).
ENDMETHOD.

  METHOD zif_flight_manager_xx~get_cheapest_flight.
    rs_flight = REDUCE #(
      INIT cheapest = VALUE zif_flight_manager_xx=>ty_flight( price = '999999.99' )
      FOR flight IN mt_flights
      NEXT cheapest = COND #(
        WHEN flight-price < cheapest-price THEN flight
        ELSE cheapest
      )
    ).
  ENDMETHOD.

  METHOD zif_flight_manager_xx~get_total_revenue.
    rv_total = REDUCE zif_flight_manager_xx=>ty_price(
    INIT total = VALUE zif_flight_manager_xx=>ty_price( )
    FOR flight IN mt_flights
    NEXT total = total + flight-price
  ).
  ENDMETHOD.

ENDCLASS.
