CLASS lcl_passenger_flight DEFINITION.
  PUBLIC SECTION.

    TYPES: BEGIN OF st_conn,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
           END OF st_conn.

    TYPES tt_flights TYPE STANDARD TABLE OF REF TO lcl_passenger_flight WITH DEFAULT KEY.

    DATA carrier_id    TYPE /dmo/carrier_id READ-ONLY.
    DATA connection_id TYPE /dmo/connection_id READ-ONLY.
    DATA flight_date   TYPE /dmo/flight_date READ-ONLY.

    METHODS constructor
      IMPORTING i_carrier_id TYPE /dmo/carrier_id
                i_connection_id TYPE /dmo/connection_id
                i_flight_date TYPE /dmo/flight_date.

    METHODS get_connection_details RETURNING VALUE(r) TYPE st_conn.
    METHODS get_free_seats RETURNING VALUE(r) TYPE i.
    METHODS get_description RETURNING VALUE(r) TYPE string_table.

    CLASS-METHODS get_flights_by_carrier
      IMPORTING i_carrier_id TYPE /dmo/carrier_id
      RETURNING VALUE(r) TYPE tt_flights.

  PRIVATE SECTION.
    DATA seats_free TYPE i.
    DATA conn TYPE st_conn.
ENDCLASS.

CLASS lcl_passenger_flight IMPLEMENTATION.

  METHOD constructor.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    flight_date = i_flight_date.

    SELECT SINGLE seats_max, seats_occupied
      FROM /lrn/passflight
      WHERE carrier_id = @carrier_id
        AND connection_id = @connection_id
        AND flight_date = @flight_date
      INTO @DATA(f).

    seats_free = f-seats_max - f-seats_occupied.

    SELECT SINGLE airport_from_id, airport_to_id
      FROM /dmo/connection
      WHERE carrier_id = @carrier_id
        AND connection_id = @connection_id
      INTO @conn.

  ENDMETHOD.

  METHOD get_flights_by_carrier.

    SELECT carrier_id, connection_id, flight_date
      FROM /lrn/passflight
      WHERE carrier_id = @i_carrier_id
      INTO TABLE @DATA(keys).

    LOOP AT keys INTO DATA(k).
          APPEND NEW lcl_passenger_flight( i_carrier_id    = k-carrier_id
                                       i_connection_id = k-connection_id
                                       i_flight_date   = k-flight_date )  TO R.
    ENDLOOP.

  ENDMETHOD.

  METHOD get_connection_details.
    r = conn.
  ENDMETHOD.

  METHOD get_free_seats.
    r = seats_free.
  ENDMETHOD.

  METHOD get_description.
    APPEND |Passenger { carrier_id } { connection_id } { flight_date }| TO r.
    APPEND |Free seats: { seats_free }| TO r.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_cargo_flight DEFINITION.
  PUBLIC SECTION.

    TYPES tt_flights TYPE STANDARD TABLE OF REF TO lcl_cargo_flight WITH DEFAULT KEY.

    DATA carrier_id    TYPE /dmo/carrier_id READ-ONLY.
    DATA connection_id TYPE /dmo/connection_id READ-ONLY.
    DATA flight_date   TYPE /dmo/flight_date READ-ONLY.

    METHODS constructor
      IMPORTING i_carrier_id TYPE /dmo/carrier_id
                i_connection_id TYPE /dmo/connection_id
                i_flight_date TYPE /dmo/flight_date.

    METHODS get_free_capacity RETURNING VALUE(r) TYPE i.
    METHODS get_description RETURNING VALUE(r) TYPE string_table.

    CLASS-METHODS get_flights_by_carrier
      IMPORTING i_carrier_id TYPE /dmo/carrier_id
      RETURNING VALUE(r) TYPE tt_flights.

  PRIVATE SECTION.

    TYPES: BEGIN OF ty_buffer,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             flight_date   TYPE /dmo/flight_date,
             max TYPE i,
             act TYPE i,
           END OF ty_buffer.

    CLASS-DATA buffer TYPE HASHED TABLE OF ty_buffer
      WITH UNIQUE KEY carrier_id connection_id flight_date.

    DATA free TYPE i.

ENDCLASS.

CLASS lcl_cargo_flight IMPLEMENTATION.

  METHOD constructor.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    flight_date = i_flight_date.

* Intentar buffer
    TRY.
        DATA(b) = buffer[ carrier_id = carrier_id
                          connection_id = connection_id
                          flight_date = flight_date ].
      CATCH cx_sy_itab_line_not_found.

        SELECT SINGLE maximum_load, actual_load
          FROM /lrn/cargoflight
          WHERE carrier_id = @carrier_id
            AND connection_id = @connection_id
            AND flight_date = @flight_date
          INTO @DATA(f).

        b-carrier_id = carrier_id.
        b-connection_id = connection_id.
        b-flight_date = flight_date.
        b-max = f-maximum_load.
        b-act = f-actual_load.

        INSERT b INTO TABLE buffer.

    ENDTRY.

    free = b-max - b-act.

  ENDMETHOD.

  METHOD get_flights_by_carrier.

    SELECT carrier_id, connection_id, flight_date
      FROM /lrn/cargoflight
      WHERE carrier_id = @i_carrier_id
      INTO TABLE @DATA(keys).

    LOOP AT keys INTO DATA(k).
      APPEND NEW lcl_CARGO_flight( i_carrier_id    = k-carrier_id
                                       i_connection_id = k-connection_id
                                       i_flight_date   = k-flight_date ) TO R.
    ENDLOOP.

  ENDMETHOD.

  METHOD get_free_capacity.
    r = free.
  ENDMETHOD.

  METHOD get_description.
    APPEND |Cargo { carrier_id } { connection_id }| TO r.
    APPEND |Free capacity: { free }| TO r.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_carrier DEFINITION.
  PUBLIC SECTION.

    TYPES tt_output TYPE STANDARD TABLE OF string WITH DEFAULT KEY.

    DATA carrier_id TYPE /dmo/carrier_id READ-ONLY.

    METHODS constructor IMPORTING i_carrier_id TYPE /dmo/carrier_id.
    METHODS get_output RETURNING VALUE(r) TYPE tt_output.

    METHODS find_passenger_flight
      IMPORTING i_airport_from_id TYPE /dmo/airport_from_id
                i_airport_to_id   TYPE /dmo/airport_to_id
                i_from_date       TYPE /dmo/flight_date
                i_seats           TYPE i
      EXPORTING e_flight TYPE REF TO lcl_passenger_flight
                e_days_later TYPE i.

    METHODS find_cargo_flight
      IMPORTING i_airport_from_id TYPE /dmo/airport_from_id
                i_airport_to_id   TYPE /dmo/airport_to_id
                i_from_date       TYPE /dmo/flight_date
                i_cargo           TYPE i
      EXPORTING e_flight TYPE REF TO lcl_cargo_flight
                e_days_later TYPE i.

  PRIVATE SECTION.
    DATA pass TYPE lcl_passenger_flight=>tt_flights.
    DATA carg TYPE lcl_cargo_flight=>tt_flights.

    METHODS get_avg_seats RETURNING VALUE(r) TYPE i.

ENDCLASS.

CLASS lcl_carrier IMPLEMENTATION.

  METHOD constructor.

    carrier_id = i_carrier_id.

    pass = lcl_passenger_flight=>get_flights_by_carrier( carrier_id ).
    carg = lcl_cargo_flight=>get_flights_by_carrier( carrier_id ).

  ENDMETHOD.

  METHOD get_output.

    APPEND |Carrier { carrier_id }| TO r.
    APPEND |Passenger: { lines( pass ) }| TO r.
    APPEND |Avg seats: { get_avg_seats( ) }| TO r.
    APPEND |Cargo: { lines( carg ) }| TO r.

  ENDMETHOD.

  METHOD find_passenger_flight.

    e_days_later = 999999.

    LOOP AT pass INTO DATA(f)
      WHERE TABLE_LINE->flight_date >= i_from_date.


      IF f->get_free_seats( ) >= i_seats.

        DATA(days) = f->flight_date - i_from_date.

        IF days < e_days_later.
          e_days_later = days.
          e_flight = f.
        ENDIF.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD find_cargo_flight.

    e_days_later = 999999.

    LOOP AT carg INTO DATA(f)
      WHERE TABLE_LINE->flight_date >= i_from_date.

      IF f->get_free_capacity( ) >= i_cargo.

        DATA(days) = f->flight_date - i_from_date.

        IF days < e_days_later.
          e_days_later = days.
          e_flight = f.
        ENDIF.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD get_avg_seats.

    DATA total TYPE i.

    LOOP AT pass INTO DATA(f).
      total += f->get_free_seats( ).
    ENDLOOP.

    IF lines( pass ) > 0.
      r = total / lines( pass ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

