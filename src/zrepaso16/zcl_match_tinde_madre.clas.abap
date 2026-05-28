CLASS zcl_match_tinde_madre DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

    "INTERFACES if_oo_adt_classrun .
    DATA usuario1 TYPE string.
    DATA usuario2 TYPE string.
    data fecha_match type d.

    CONSTANTS max_matches type i VALUE 999.

    "-- Atributo estático: cuenta todos los matches creados
    CLASS-DATA gv_total_matches TYPE i.

    methods:
    constructor IMPORTING i_usuario1 type string
                          i_usuario2 type string
                          i_fecha_match type d
                          i_compatibilidad TYPE i,

    es_super_match  RETURNING VALUE(rv_resultado) TYPE abap_bool,


    describir_match RETURNING VALUE(rv_texto) TYPE string.

    "-- Método estático para consultar el total
    CLASS-METHODS get_total_matches
      RETURNING VALUE(rv_total) TYPE i.

  PROTECTED SECTION.
  "-- Privado → Protegido para que la hija pueda leerlo
    DATA compatibilidad TYPE i.
  PRIVATE SECTION.
  "data compatibilidad  type i.

ENDCLASS.

CLASS zcl_match_tinde_madre IMPLEMENTATION.

method constructor.
    usuario1 = i_usuario1.
    usuario2 = i_usuario2.
    fecha_match = i_fecha_match.
    compatibilidad = i_compatibilidad.
    gv_total_matches = gv_total_matches + 1.
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

METHOD get_total_matches.
    rv_total = gv_total_matches.
  ENDMETHOD.


ENDCLASS.
