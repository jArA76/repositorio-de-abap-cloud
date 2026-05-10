CLASS zcl_dw_manager16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.


    TYPES tt_servicios TYPE STANDARD TABLE OF zservicios." WITH EMPTY KEY.

    METHODS: "mejor hacerlo de la manera simplificada.

      creardueno IMPORTING i_dueno TYPE zdueno EXPORTING o_valido    TYPE abap_bool,

      creaperro IMPORTING i_perro TYPE zperros EXPORTING o_valido    TYPE abap_bool,

      crearpaseador IMPORTING i_paseador TYPE zpaseador EXPORTING o_valido   TYPE abap_bool,

      crearservicio IMPORTING i_servicio TYPE zservicios EXPORTING o_valido TYPE abap_bool,

      crearvaloracion IMPORTING i_valoracion TYPE zvaloracion EXPORTING o_valido  TYPE abap_bool,


                        get_servicios_paseador IMPORTING i_id_paseador TYPE zservicios-id_paseador "recibe un ID de paseador y devuelve una tabla interna de servicios
                        EXPORTING tablaserv TYPE tt_servicios,

                        get_servicios_perros IMPORTING i_id_perro TYPE zperros-id_perro  "recibe un ID de perro y devuelve una tabla interna de servicios
                        EXPORTING tablaserv TYPE tt_servicios,

                        get_media_valoracion IMPORTING i_id_paseador
                        TYPE zpaseador-id_paseador EXPORTING media TYPE decfloat16.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS:


      check_dueno_exists IMPORTING i_dueno TYPE zdueno-id_dueno returNING VALUE(rv_ok) TYPE i,

      check_perro_exists IMPORTING i_perro TYPE zperros-id_perro returNING VALUE(rv_ok) TYPE i,

      check_paseador_exists IMPORTING i_paseador TYPE zpaseador-id_paseador returNING VALUE(rv_ok) TYPE i,

      check_servicio IMPORTING i_servicio TYPE zservicios-tipo_servicio returNING VALUE(rv_ok) TYPE i, "comprueba que el tipo de servicio exista.

      "check_servicio_exists IMPORTING i_servicio TYPE zservicios-id_servicio EXPORTING vaLUE(rv_ok) type abap_bool,
      check_servicio_exists IMPORTING i_servicio TYPE zservicios-id_servicio returNING VALUE(rv_ok) TYPE i, "comprueba que un id de servicio exista en la tabla zservicios.

      check_tamano importing i_tamano type zperros-tamano returNING VALUE(rv_ok) TYPE i,"para comprobar el tamaño del perro.

      check_estado importing i_estado type zservicios-estado returNING VALUE(rv_ok) TYPE i.

      "check_puntuacion importing i_punto type zvaloracion-puntuacion returNING VALUE(rv_ok) TYPE i.




ENDCLASS.

CLASS zcl_dw_manager16 IMPLEMENTATION.

 METHOD crearservicio.
   IF check_estado( i_servicio-estado ) = 1 AND check_servicio( i_servicio-tipo_servicio ) = 1 AND check_paseador_exists( i_servicio-id_paseador ) = 1
    AND check_perro_exists( i_servicio-id_perro ) = 1 and i_servicio-fecha_fin >= i_servicio-fecha_inicio.
       insert zservicios from @i_servicio.
       IF sy-subrc = 0. " Ha ido bien
          o_valido = abap_true.
         ELSE.
          o_valido = abap_false.
         ENDIF.
       else.
       o_valido = abap_false.
      return.
      ENDIF.
 ENDMETHOD.

  METHOD creardueno.
  "o_valido = abap_true.

  IF check_dueno_exists( i_dueno-id_dueno ) = 1. "si el id_dueno ya existe que se salga.
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

    IF check_dueno_exists( i_perro-id_dueno ) = 1 AND check_perro_exists( i_perro-id_perro ) = 2 AND check_tamano( i_perro-tamano ) = 1.
      "si el dueño existe y el id_perro no existe y el tamaño existe en la lista existente.....crealo.
      " o_valido = abap_false.

      INSERT zperros FROM @i_perro.

      IF sy-subrc = 0. " Ha ido bien
        o_valido = abap_true.
      ELSE.
        o_valido = abap_false.
      ENDIF.
    ELSE.
      o_valido = abap_false.
      RETURN.

    ENDIF.
  ENDMETHOD.

  METHOD crearpaseador.
  IF check_paseador_exists( i_paseador-id_paseador ) = 1.
      o_valido = abap_false.
      RETURN.
     else.

    if i_paseador-nombre is initial.
    o_valido = abap_false.
       return.
    endif.
  INSERT zpaseador FROM @i_paseador.

    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
 endIF.
ENDMETHOD.

 METHOD crearvaloracion.

   if check_servicio_exists( i_valoracion-id_servicio ) = 2 aND  i_valoracion-puntuacion betweEN '1' and '5'.

    INSERT zvaloracion FROM @i_valoracion.
    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
    else.
      o_valido = abap_false.
      return.
    eNDIF.
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
    SELECT SINGLE @abap_true FROM zperros WHERE id_perro = @i_perro into @data(sincoincidencia).
   IF sy-subrc = 0. "si devuelve algo, el id_perro existe
      rv_ok = 1.
    ELSE.
      rv_ok = 2.
    ENDIF.

  ENDMETHOD.

  method check_tamano.

    SELECT SINGLE * FROM ddcds_customer_domain_value_t( p_domain_name = 'ZTAMANO16' )
        WHERE value_low = @i_tamano INTO @DATA(ls_test).
    IF sy-subrc = 0. "si el tamaño existe.
      rv_ok = 1.
    ELSE.
      rv_ok = 2.
    ENDIF.

  ENDMETHOD.

  METHOD check_paseador_exists.
    SELECT SINGLE @abap_true FROM zpaseador WHERE id_paseador = @i_paseador into @data(sincoincidencia).
    IF sy-subrc = 0. "si devuelve algo, el dueño existe
      rv_ok = 1.
    ELSE.
      rv_ok = 2.
    ENDIF.
  ENDMETHOD.

method check_estado.
    SELECT SINGLE * FROM ddcds_customer_domain_value_t( p_domain_name = 'ZESTADO16' )
        WHERE value_low = @i_estado INTO @DATA(ls_test).
    IF sy-subrc = 0. "si el estado existe.
      rv_ok = 1.
    ELSE.
      rv_ok = 2.
    ENDIF.

  ENDMETHOD.

  METHOD check_servicio. "comprueba que el servicio exista, no tiene porque estar completado.
    SELECT SINGLE * FROM ddcds_customer_domain_value_t( p_domain_name = 'ZSERVICIO16' )
        WHERE value_low = @i_servicio INTO @DATA(ls_test).
    IF sy-subrc = 0. "si el servicio existe.
      rv_ok = 1.
    ELSE.
      rv_ok = 2.
    ENDIF.
  ENDMETHOD.

  METHOD check_servicio_exists.
    SELECT SINGLE @abap_true FROM zservicios WHERE id_servicio = @i_servicio and estado = 'CO' into @data(sincoincidencia).
    IF sy-subrc = 0. "si el servicio existe y tiene valoracion completada,es decir, si lo encuentra, lo siguiente que hace es buscar en zvaloracion si ya esta el servicio valorado.
        select single * from zvaloracion where id_servicio = @i_servicio into @data(sicoincidencia). "compruebo si ya esta valorado
          IF sy-subrc = 0.
             rv_ok = 1.
             ELSE. "si no lo encuentra.
             rv_ok = 2.
        endIF.
        else.
      rv_ok = 3.
    ENDIF.
  ENDMETHOD.


METHOD get_servicios_paseador.
    SELECT * FROM zservicios WHERE id_paseador = @i_id_paseador INTO TABLE @tablaserv.
  ENDMETHOD.

  METHOD get_servicios_perros.
    SELECT * FROM zservicios WHERE id_perro = @i_id_perro INTO TABLE @tablaserv.
  ENDMETHOD.

  METHOD get_media_valoracion.

     SELECT AVG( puntuacion ) as valoracionmed FROM zvaloracion inNER joiN zservicios ON zvaloracion~id_servicio = zservicios~id_servicio
     WHERE zservicios~id_paseador = @i_id_paseador INTO @DATA(lv_media).
     media = lv_media.
    ENDMETHOD.
  ENDCLASS.

