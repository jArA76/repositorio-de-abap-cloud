CLASS zcl_cp03_xx DEFINITION
  PUBLIC
  INHERITING FROM cl_demo_classrun
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS main REDEFINITION.

ENDCLASS.

CLASS zcl_cp03_xx IMPLEMENTATION.

  METHOD main.
    DATA lo_manager TYPE REF TO zcl_flight_manager_xx.
    DATA ls_flight  TYPE zif_flight_manager_xx=>ty_flight.
    DATA lt_result  TYPE zif_flight_manager_xx=>tt_flights.
    DATA lv_total   TYPE zif_flight_manager_xx=>ty_price.

    " 1. Crear instancia
    lo_manager = NEW zcl_flight_manager_xx( ).

    " 2. Añadir 5 vuelos válidos
    TRY.
        ls_flight = VALUE #( airline = 'LH' flightnum = '0400' price = '350.00' ).
        lo_manager->zif_flight_manager_xx~add_flight( ls_flight ).

        ls_flight = VALUE #( airline = 'LH' flightnum = '0401' price = '420.00' ).
        lo_manager->zif_flight_manager_xx~add_flight( ls_flight ).

        ls_flight = VALUE #( airline = 'IB' flightnum = '1100' price = '180.00' ).
        lo_manager->zif_flight_manager_xx~add_flight( ls_flight ).

        ls_flight = VALUE #( airline = 'IB' flightnum = '1101' price = '210.00' ).
        lo_manager->zif_flight_manager_xx~add_flight( ls_flight ).

        ls_flight = VALUE #( airline = 'AA' flightnum = '0005' price = '500.00' ).
        lo_manager->zif_flight_manager_xx~add_flight( ls_flight ).

      CATCH zcx_flight_error_xx INTO DATA(lx).
        out->write( |Error inesperado: { lx->mv_message }| ).
    ENDTRY.

    " 3. Vuelo con precio negativo
    TRY.
        ls_flight = VALUE #( airline = 'FR' flightnum = '9001' price = '-50.00' ).
        lo_manager->zif_flight_manager_xx~add_flight( ls_flight ).
      CATCH zcx_flight_error_xx INTO DATA(lx_neg).
        out->write( |[ERROR precio negativo]: { lx_neg->mv_message }| ).
    ENDTRY.

    " 4. Vuelo duplicado
    TRY.
        ls_flight = VALUE #( airline = 'LH' flightnum = '0400' price = '300.00' ).
        lo_manager->zif_flight_manager_xx~add_flight( ls_flight ).
      CATCH zcx_flight_error_xx INTO DATA(lx_dup).
        out->write( |[ERROR duplicado]: { lx_dup->mv_message }| ).
    ENDTRY.

    " 5. Vuelos de aerolínea IB
    out->write( '--- Vuelos de IB ---' ).
    lt_result = lo_manager->zif_flight_manager_xx~get_flights_by_airline( 'IB' ).
    LOOP AT lt_result INTO ls_flight.
      out->write( |{ ls_flight-airline } { ls_flight-flightnum } { ls_flight-price }| ).
    ENDLOOP.

    " 6. Vuelo más barato
    out->write( '--- Vuelo más barato ---' ).
    DATA(ls_cheapest) = lo_manager->zif_flight_manager_xx~get_cheapest_flight( ).
    out->write( |{ ls_cheapest-airline } { ls_cheapest-flightnum } { ls_cheapest-price }| ).

    " 7. Facturación total
    out->write( '--- Facturación total ---' ).
    lv_total = lo_manager->zif_flight_manager_xx~get_total_revenue( ).
    out->write( |Total: { lv_total }| ).

  ENDMETHOD.

ENDCLASS.
