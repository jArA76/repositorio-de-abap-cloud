CLASS zcl_dw_manager16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.


    TYPES tt_servicios TYPE STANDARD TABLE OF zservicios WITH EMPTY KEY.

    METHODS: "mejor hacerlo de la manera simplificada.

      creardueno IMPORTING i_dueno TYPE zdueno EXPORTING o_valido    TYPE abap_bool,

      creaperro IMPORTING i_perro TYPE zperros EXPORTING o_valido    TYPE abap_bool,

      crearpaseador IMPORTING i_paseador TYPE zpaseador EXPORTING o_valido    TYPE abap_bool,

      crearservicio IMPORTING i_servicio TYPE zservicios EXPORTING o_valido      TYPE abap_bool,

      crearvaloracion IMPORTING i_valoracion TYPE zvaloracion EXPORTING o_valido      TYPE abap_bool,


                        get_servicios_paseador IMPORTING i_id_paseador TYPE zpaseador-id_paseador
                        EXPORTING tablaserv TYPE tt_servicios,

                         get_servicios_perros IMPORTING i_id_perro TYPE zperros-id_perro
                        EXPORTING tablaserv TYPE tt_servicios,

                        get_media_valoracion IMPORTING i_id_paseador
                        TYPE zpaseador-id_paseador EXPORTING valoracmedia TYPE decfloat16.




  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:


      check_dueno_exists IMPORTING i_dueno TYPE zdueno-id_dueno returNING VALUE(rv_ok) TYPE i,

      check_perro_exists IMPORTING i_perro TYPE zperros-id_perro EXPORTING rv_ok TYPE abap_bool,

      check_paseador_exists IMPORTING i_paseador TYPE zpaseador-id_paseador EXPORTING rv_ok TYPE abap_bool,

      check_servicio_exists IMPORTING i_servicio TYPE zservicios-id_servicio EXPORTING rv_ok TYPE abap_bool,

      check_servicio_completado IMPORTING i_servicio TYPE zservicios-id_servicio EXPORTING rv_ok TYPE abap_bool.

ENDCLASS.

CLASS zcl_dw_manager16 IMPLEMENTATION.

  METHOD creardueno.
  o_valido = abap_true.

  IF check_dueno_exists( i_dueno-id_dueno ) = 1.
      o_valido = abap_false.
      RETURN.
     else.

    if i_dueno-nombre is initial.
    o_valido = abap_false.
       return.
    endif.
  INSERT zdueno FROM @i_dueno.

    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
endIF.
  ENDMETHOD.

  METHOD creaperro.
    INSERT zperros FROM @i_perro.

    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD crearpaseador.
    INSERT zpaseador FROM @i_paseador.

    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD crearservicio.
    INSERT zservicios FROM @i_servicio.

    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
  ENDMETHOD.

  METHOD crearvaloracion.
    INSERT zvaloracion FROM @i_valoracion.

    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.

  ENDMETHOD.



  METHOD get_servicios_paseador.
    SELECT * FROM zservicios WHERE id_paseador = @i_id_paseador INTO TABLE @tablaserv.
  ENDMETHOD.

  METHOD get_servicios_perros.
    SELECT * FROM zservicios WHERE id_perro = @i_id_perro INTO TABLE @tablaserv.
  ENDMETHOD.

  METHOD get_media_valoracion.
    " SELECT * FROM zvaloracion WHERE id_valoracion = @i_id_paseador INTO valoracmedia.
  ENDMETHOD.


  METHOD check_dueno_exists. "pregunto si existe algun registro con el id_dueno que recibe.
    SELECT SINGLE @abap_true FROM zdueno WHERE id_dueno = @i_dueno into @data(sincoincidencia).
    IF sy-subrc = 0. "si devuelve algo, el dueño existe
      rv_ok = 1.
    ELSE.
      rv_ok = 2.
    ENDIF.
  ENDMETHOD.


  METHOD check_perro_exists.
    SELECT SINGLE @abap_true FROM zperros WHERE id_perro = @i_perro INTO @rv_ok.
  ENDMETHOD.
  METHOD check_paseador_exists.
    SELECT SINGLE @abap_true FROM zpaseador WHERE id_paseador = @i_paseador INTO @rv_ok.
  ENDMETHOD.
  METHOD check_servicio_exists. "comprueba que el servicio exista, no tiene porque estar completado.
    SELECT SINGLE @abap_true FROM zservicios WHERE id_servicio = @i_servicio INTO @rv_ok.
  ENDMETHOD.
  METHOD check_servicio_completado.
    SELECT SINGLE @abap_true FROM zservicios WHERE id_servicio = @i_servicio AND estado = 'CO' INTO @rv_ok.
  ENDMETHOD.

ENDCLASS.
