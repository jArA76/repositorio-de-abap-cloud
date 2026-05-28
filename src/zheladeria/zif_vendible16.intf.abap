INTERFACE zif_vendible16
public.

"Métodos que CUALQUIER jugador debe tener
*  METHODS sacar
*    IMPORTING iv_velocidad TYPE i
*    RAISING   zcx_error_tenis.

  METHODS calcular_precio

    RETURNING VALUE(rv_importe) TYPE decfloat16.

  METHODS describir
    RETURNING VALUE(rv_cadtexto) TYPE string.

ENDINTERFACE.
