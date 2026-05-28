CLASS zcl_match_tinder16local DEFINITION.

  PUBLIC SECTION.

    DATA usuario1 TYPE string.
    DATA usuario2 TYPE string.
    data fecha_match type d.

    CONSTANTS max_matches type i VALUE 999.

    methods:
    constructor IMPORTING i_usuario1 type string
                          i_usuario2 type string
                          i_fecha_match type d
                          i_compatibilidad TYPE i,

    es_super_match  RETURNING VALUE(rv_resultado) TYPE abap_bool,


    describir_match RETURNING VALUE(rv_texto) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
  data compatibilidad  type i.
ENDCLASS.

CLASS zcl_match_tinder16local IMPLEMENTATION.


  method constructor.
    usuario1 = i_usuario1.
    usuario2 = i_usuario2.
    fecha_match = i_fecha_match.
    compatibilidad = i_compatibilidad.
  endmethod.

  method es_super_match.
    rv_resultado = abap_false.
    if compatibilidad > 80.
      rv_resultado = abap_true.

      else.
       rv_resultado = abap_false.
    endif.
  endmethod.


  METHOD describir_match.
    rv_texto = |Match entre { usuario1 } y { usuario2 } | &
               |el { fecha_match DATE = USER } — | &
               |Compatibilidad: { compatibilidad }%|.
  ENDMETHOD.


ENDCLASS.

