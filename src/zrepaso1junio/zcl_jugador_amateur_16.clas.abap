"" Clase concreta: ZCL_JUGADOR_AMATEUR
CLASS zcl_jugador_amateur_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_jugador_base_16.

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING
          iv_nombre TYPE string
          iv_pais   TYPE string
          iv_club   TYPE string,

      zif_puntuable_16~calcular_puntos
        REDEFINITION,

      zif_puntuable_16~get_resumen
        REDEFINITION.

  PRIVATE SECTION.
    DATA mv_club TYPE string.
    CONSTANTS mc_puntos_victoria TYPE i VALUE 50.

ENDCLASS.

CLASS zcl_jugador_amateur_16 IMPLEMENTATION.

  METHOD constructor.
    super->constructor( iv_nombre = iv_nombre iv_pais = iv_pais ).
    mv_club = iv_club.
  ENDMETHOD.

  METHOD zif_puntuable_16~calcular_puntos.
    DATA lv_bonus TYPE i.
    IF mv_victorias >= 3.
      lv_bonus = 20.
    ENDIF.
    rv_puntos = ( mv_victorias * mc_puntos_victoria ) + lv_bonus.
  ENDMETHOD.

  METHOD zif_puntuable_16~get_resumen.
    rv_texto = |AMATEUR { mv_nombre } [{ mv_club }] | &&
              |V:{ mv_victorias } D:{ mv_derrotas } | &&
              |Puntos:{ zif_puntuable_16~calcular_puntos( ) }|.
  ENDMETHOD.

ENDCLASS.


