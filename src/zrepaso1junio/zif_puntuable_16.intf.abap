"" Interfaz: ZIF_PUNTUABLE
INTERFACE zif_puntuable_16
  PUBLIC.

  METHODS:
    calcular_puntos
      RETURNING VALUE(rv_puntos) TYPE i,

    get_resumen
      RETURNING VALUE(rv_texto) TYPE string.

ENDINTERFACE.
