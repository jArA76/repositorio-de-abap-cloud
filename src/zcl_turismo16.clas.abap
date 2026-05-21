CLASS zcl_turismo16 DEFINITION
  PUBLIC
  INHERITING FROM zcl_vehiculo16
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA:   mv_num_plazas TYPE i,
          mv_carroceria TYPE string.

    METHODS: get_ficha
        REDEFINITION,
      calcular_impuesto
        REDEFINITION,

      set_carroceria IMPORTING i_carroceria TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TURISMO16 IMPLEMENTATION.


METHOD get_ficha.
    DATA(lv_ficha_padre) = super->get_ficha( ).  "declaro una variable en linea
                "que se va a heredar de su padre lo que tenga get_ficha + lo que
                 "viene a continuacion

    rs_ficha = |{ lv_ficha_padre } | &
               |Plazas: { mv_num_plazas } | &
               |Carrocería: { mv_carroceria }|.
  ENDMETHOD.


  METHOD calcular_impuesto.
    IF mv_anio_fabric < 2000.
      rv_importe = '350.00'.
    ELSE.
      rv_importe = '180.00'.
    ENDIF.
  ENDMETHOD.


  METHOD set_carroceria.
    mv_carroceria = i_carroceria.
  ENDMETHOD.
ENDCLASS.
