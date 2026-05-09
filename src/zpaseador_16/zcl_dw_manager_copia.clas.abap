CLASS zcl_dw_manager_copia DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES tt_servicios
        TYPE STANDARD TABLE OF zdw_servicio
        WITH EMPTY KEY.

    METHODS:
      crear_servicio IMPORTING i_servicio      TYPE zdw_servicio
                     RETURNING VALUE(rv_exito) TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.


    METHODS:

      get_servicios IMPORTING i_id_perro         TYPE zdw_servicio-id_perro
                    RETURNING VALUE(t_servicios) TYPE tt_servicios,

      check_paseador IMPORTING i_id_paseador   TYPE zdw_servicio-id_paseador
                     RETURNING VALUE(rv_exito) TYPE abap_bool,

      check_perro IMPORTING i_id_perro      TYPE zdw_servicio-id_perro
                  RETURNING VALUE(rv_exito) TYPE abap_bool,

      check_estado IMPORTING i_estado        TYPE zdw_servicio-estado
                   RETURNING VALUE(rv_exito) TYPE abap_bool.
ENDCLASS.

CLASS zcl_dw_manager_copia IMPLEMENTATION.

  METHOD crear_servicio.

    rv_exito = abap_true.

    " Validaciones con respecto al perro
    " Comprobamos que el usuario a indicado un ID
    IF i_servicio-id_perro IS INITIAL. "si esta vacio.
      rv_exito = abap_false.
      RETURN.

    ELSE. " Comprobamos si el ID existe en la BD
*      DATA(lv_exito) = check_perro( i_servicio-id_perro ).
      IF check_perro( i_servicio-id_perro ) = abap_false.
        rv_exito = abap_false.
        RETURN.
      ENDIF.

*      " Comprobación de estados
*      CASE i_servicio-estado.
*        WHEN 'PE' OR 'AC' OR 'CO' OR 'CA'.
*
*        WHEN OTHERS.
*          rv_exito = abap_false.
*          RETURN.
*      ENDCASE.

      IF check_estado( i_servicio-estado ) = abap_false.
        rv_exito = abap_false.
        RETURN.
      ENDIF.


      " Comprobación de servicios
      CASE i_servicio-tipo_servicio.
        WHEN 'PA' OR 'GU' OR 'AD'.

        WHEN OTHERS.
          rv_exito = abap_false.
          RETURN.
      ENDCASE.

      " Compración de fechas
      IF i_servicio-fecha_fin < i_servicio-fecha_inicio.
        rv_exito = abap_false.
        RETURN.
      ENDIF.

    ENDIF.

    IF i_servicio-id_paseador IS INITIAL.
      rv_exito = abap_false.
      RETURN.
    ENDIF.

    IF i_servicio-id_servicio IS INITIAL.
      rv_exito = abap_false.
      RETURN.
    ENDIF.

    INSERT zdw_servicio FROM @i_servicio.
    IF sy-subrc <> 0.
      rv_exito = abap_false.
      RETURN.
    ENDIF.


  ENDMETHOD.


  METHOD check_perro.

    SELECT SINGLE * FROM zdw_perro
        WHERE id_perro = @i_id_perro
        INTO @DATA(ls_test).
    IF sy-subrc = 0.
      rv_exito = abap_true.
    ELSE.
      rv_exito = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD check_estado.

    SELECT SINGLE * FROM ddcds_customer_domain_value_t(
                            p_domain_name = 'ZDD_ESTADO' )
        WHERE value_low = @i_estado
        INTO @DATA(ls_test).
    IF sy-subrc = 0.
      rv_exito = abap_true.
    ELSE.
      rv_exito = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD check_paseador.

  ENDMETHOD.

  METHOD get_servicios.
    SELECT * FROM zdw_servicio
        WHERE id_perro = @i_id_perro
        INTO TABLE @t_servicios.
  ENDMETHOD.

ENDCLASS.
