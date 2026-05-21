CLASS zcl_16_flight DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    data carrier_id type /dmo/carrier_id READ-ONLY.
    data connection_id TYPE /dmo/connection_id READ-ONLY.
    data airport_from type /dmo/airport_from_id READ-ONLY.
    data airport_to type /dmo/airport_to_id READ-ONLY.

    methods:
         constructor
         importing
             i_connection_id TYPE /dmo/connection_id
             i_carrier_id type /dmo/carrier_id
             i_plane_type type /dmo/plane_type_id

             RAISING  ZCX_C_ABAPD_NO_CONNECTION.

  PROTECTED SECTION.
  data plane_type type /dmo/plane_type_id.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_16_flight IMPLEMENTATION.

method constructor.

    select single from /dmo/connection
    FIELDS airport_from_id, airport_to_id
    where carrier_id = @i_carrier_id and connection_id = @i_connection_id

     into ( @data(lv_airport_from), @data(lv_airport_to) ).
    "ENDSELECT.
    if sy-subrc = 0.
    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    plane_type = i_plane_type.
    airport_from = lv_airport_from.
    airport_to   = lv_airport_to.

    else.

      raise exception type ZCX_C_ABAPD_NO_CONNECTION.
    endif.



ENDMETHOD.

ENDCLASS.
