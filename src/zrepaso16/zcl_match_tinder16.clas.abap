CLASS zcl_match_tinder16 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .



  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_match_tinder16 IMPLEMENTATION.




  METHOD if_oo_adt_classrun~main.

  DATA(lo_match) = NEW zcl_match_tinder16local(
    i_usuario1       = 'Carlos'
    i_usuario2       = 'Laura'
    i_fecha_match          = '20250527'
    i_compatibilidad = 85
  ).

  "-- Descripción del match
  out->write( lo_match->describir_match( ) ).

  "-- Comprobamos si es super match
  IF lo_match->es_super_match( ) = abap_true.
    out->write( '¡Es un SUPER MATCH! 🔥' ).
  ELSE.
    out->write( 'Es un match normal.' ).
  ENDIF.

  "-- Mostramos la constante
  out->write( |Máximo de matches permitidos: { zcl_match_tinder16local=>max_matches } | ).

  ENDMETHOD.




ENDCLASS.
