INTERFACE zif_flight_manager_xx
  PUBLIC.

  TYPES:
    BEGIN OF ty_flight,
      airline    TYPE c LENGTH 3,
      flightnum  TYPE c LENGTH 4,
      price      TYPE p LENGTH 8 DECIMALS 2,
    END OF ty_flight,
    tt_flights TYPE STANDARD TABLE OF ty_flight WITH DEFAULT KEY,
    ty_price   TYPE p LENGTH 8 DECIMALS 2.

  METHODS:
    add_flight
      IMPORTING
        is_flight TYPE ty_flight
      RAISING
        zcx_flight_error_xx,

    get_flights_by_airline
      IMPORTING
        iv_airline        TYPE c
      RETURNING
        VALUE(rt_flights) TYPE tt_flights,

    get_cheapest_flight
      RETURNING
        VALUE(rs_flight) TYPE ty_flight,

    get_total_revenue
      RETURNING
         VALUE(rv_total) TYPE zif_flight_manager_xx=>ty_price.

ENDINTERFACE.
