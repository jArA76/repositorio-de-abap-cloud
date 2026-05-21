CLASS lcl_flight DEFINITION.

  PUBLIC SECTION.

    " Atributos básicos
    DATA carrier_id    TYPE string READ-ONLY.
    DATA connection_id TYPE string READ-ONLY.

    " Estructura (como en tu código original)
    TYPES:
      BEGIN OF st_connection_details,
        airport_from TYPE string,
        airport_to   TYPE string,
      END OF st_connection_details.

    " Tabla de objetos
    TYPES tt_flights TYPE STANDARD TABLE OF REF TO lcl_flight WITH DEFAULT KEY.

    " Constructor
    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE string
        i_connection_id TYPE string.

    " Método que devuelve la estructura
    METHODS get_connection_details
      RETURNING VALUE(r_result) TYPE st_connection_details.

    " Método estático que crea vuelos
    CLASS-METHODS get_flights
      RETURNING VALUE(r_result) TYPE tt_flights.

  PRIVATE SECTION.

    " Variable interna de tipo estructura
    DATA connection_details TYPE st_connection_details.

ENDCLASS.

CLASS lcl_flight IMPLEMENTATION.

  METHOD constructor.

    carrier_id    = i_carrier_id.
    connection_id = i_connection_id.

    " Rellenamos datos simples (simulación)
    connection_details-airport_from = 'MAD'.
    connection_details-airport_to   = 'BCN'.

  ENDMETHOD.


  METHOD get_connection_details.

    r_result = connection_details.

  ENDMETHOD.


  METHOD get_flights.

    " Tabla interna simple (simula datos)
    TYPES: BEGIN OF ty_key,
             carrier_id    TYPE string,
             connection_id TYPE string,
           END OF ty_key.

    DATA keys TYPE STANDARD TABLE OF ty_key.

    APPEND VALUE #( carrier_id = 'LH' connection_id = '1000' ) TO keys.
    APPEND VALUE #( carrier_id = 'IB' connection_id = '2000' ) TO keys.

    " LOOP + creación de objetos
    LOOP AT keys INTO DATA(key).

      APPEND NEW lcl_flight(
        i_carrier_id    = key-carrier_id
        i_connection_id = key-connection_id
      ) TO r_result.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
