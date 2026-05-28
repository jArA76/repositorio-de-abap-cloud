CLASS zcl_match_superlike16 DEFINITION
  PUBLIC
INHERITING FROM zcl_match_tinde_madre
 FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA mensaje_superlike TYPE string.

    METHODS:
      constructor IMPORTING hija_usuario1       TYPE string
                            hija_usuario2       TYPE string
                            hija_fecha_match    TYPE d
                            hija_compatibilidad TYPE i
                            i_mensaje        TYPE string,

      "es_super_match  REDEFINITION,


      describir_match REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.

CLASS zcl_match_superlike16 IMPLEMENTATION.

  METHOD constructor.
   super->constructor(
   i_usuario1 = hija_usuario1
   i_usuario2 = hija_usuario2
   i_fecha_match = hija_fecha_match
   i_compatibilidad = hija_compatibilidad
    ).

    mensaje_superlike = i_mensaje.
ENDMETHOD.

   METHOD describir_match.
    "-- Reutilizamos el texto de la madre y le añadimos el superlike
    DATA(lv_base) = super->describir_match( ).
    rv_texto = |{ lv_base } ⭐ SUPERLIKE: { mensaje_superlike }|.
  ENDMETHOD.

ENDCLASS.
