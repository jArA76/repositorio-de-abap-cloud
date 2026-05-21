CLASS zcl_camion_16 DEFINITION
  PUBLIC
  INHERITING FROM zcl_vehiculo16
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA: mv_tonelaje TYPE decfloat16,
          mv_num_ejes TYPE i,
          mv_remolque TYPE abap_bool.

    METHODS: get_ficha
        REDEFINITION,

      calcular_impuesto
        REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CAMION_16 IMPLEMENTATION.


METHOD get_ficha.
    DATA(lv_ficha_padre) = super->get_ficha( ).
    DATA(lv_remolque)    = COND string( WHEN mv_remolque = abap_true
                                        THEN 'Sí'
                                        ELSE 'No' ).

    rs_ficha = |{ lv_ficha_padre } | &
               |Tonelaje: { mv_tonelaje } t | &
               |Ejes: { mv_num_ejes } | &
               |Remolque: { lv_remolque }|.
  ENDMETHOD.


  METHOD calcular_impuesto.
    rv_importe = mv_tonelaje * 120.
  ENDMETHOD.
ENDCLASS.
