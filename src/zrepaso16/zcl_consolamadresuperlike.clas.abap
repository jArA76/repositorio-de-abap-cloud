CLASS zcl_consolamadresuperlike DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consolamadresuperlike IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA lt_matches TYPE TABLE OF REF TO zcl_match_tinde_madre.

"-- Match normal
lt_matches = VALUE #( BASE lt_matches
  ( NEW zcl_match_tinde_madre(
      i_usuario1       = 'Carlos'
      i_usuario2       = 'Laura'
      i_fecha_match    = '20250527'
      i_compatibilidad = 75 ) )
).

"-- Superlike
lt_matches = VALUE #( BASE lt_matches
  ( NEW zcl_match_superlike16(
      hija_usuario1       = 'Ana'
      hija_usuario2       = 'Pedro'
      hija_fecha_match    = '20250527'
      hija_compatibilidad = 95
      i_mensaje        = '¡Me encantó tu perfil!' ) )
).

"-- Polimorfismo: cada objeto ejecuta SU versión de describir_match
LOOP AT lt_matches INTO DATA(lo_match).
  out->write( lo_match->describir_match( ) ).
  IF lo_match->es_super_match( ) = abap_true.
    out->write( '→ ¡SUPER MATCH! 🔥' ).
  ENDIF.
ENDLOOP.

"-- Total de matches creados (método estático)
out->write( |Total matches creados: { zcl_match_tinde_madre=>get_total_matches( ) }| ).




  ENDMETHOD.
ENDCLASS.
