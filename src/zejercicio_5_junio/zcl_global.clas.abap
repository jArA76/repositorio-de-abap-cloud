CLASS zcl_global DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES tt_reservas TYPE STANDARD TABLE OF ztab_verano_16 WITH DEFAULT KEY.


    METHODS:

      constructor IMPORTING
                    i_nom_cli       TYPE zde_nom_cl
                    i_apellidos     TYPE zde_apedillo
                    i_telef         TYPE zde_tlf
                    i_diasactiv     TYPE i
                    i_activicontrat TYPE i,

      calcular_imp RETURNING VALUE(e_import) TYPE i,
      generar_id RETURNING VALUE(rv_id) TYPE i,
      alta_reserva RETURNING VALUE(rv_id) TYPE string,
      modif_reserva IMPORTING i_reserva          TYPE i
                              i_nom              TYPE string
                              i_apell            TYPE string
                              i_telef            TYPE i
                              i_numdiasacti      TYPE i
                              i_numacticontra    TYPE i

                    RETURNING VALUE(rv_respuest) TYPE string,


      cons_reserva IMPORTING i_reserva TYPE i RETURNING VALUE(rt_reservas) TYPE tt_reservas,
      cons_registros IMPORTING i_cuantos TYPE i RETURNING VALUE(rt_reservas) TYPE tt_reservas.


  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA nom_cli TYPE zde_nom_cl.
    DATA apellidos TYPE zde_apedillo.
    DATA telef TYPE zde_tlf.
    DATA dias_actividad TYPE i.
    DATA actividades_contrat TYPE i.
ENDCLASS.

CLASS zcl_global IMPLEMENTATION.

  METHOD constructor.
    nom_cli = i_nom_cli.
    apellidos = i_apellidos.
    telef = i_telef.
    dias_actividad = i_diasactiv.
    actividades_contrat = i_activicontrat.
  ENDMETHOD.

  METHOD calcular_imp.
    e_import = 100 + ( actividades_contrat * 25 ) + ( dias_actividad * 40 ).
  ENDMETHOD.

  METHOD generar_id.
    DATA id_max TYPE i.
    SELECT MAX( id_reserva ) FROM ztab_verano_16 INTO @id_max.

    IF sy-subrc = 0 AND id_max IS NOT INITIAL. " si la selec ha ido bien y el id ya esta iniciado con alguna reserva.
      rv_id = id_max + 1.             "devuelve el siguiente.
    ELSE.
      rv_id = 000001.         "si no hay ningun id le mete 1.
    ENDIF.
  ENDMETHOD.

  METHOD alta_reserva.


    DATA ls_reservas TYPE ztab_verano_16.


    ls_reservas-id_reserva = generar_id( ).
    ls_reservas-nombre_cliente = nom_cli.
    ls_reservas-apellido_cliente = apellidos.
    ls_reservas-telefono = telef.
    ls_reservas-importe_total = calcular_imp( ).

    INSERT ztab_verano_16 FROM @ls_reservas.
    IF sy-subrc = 0.
      rv_id = |Reserva creada correctamente con ID { ls_reservas-id_reserva }|.
    ELSE.
      rv_id = 'Error al crear mensaje'.
    ENDIF.

  ENDMETHOD.


  METHOD modif_reserva.

    DATA ls_reservas TYPE ztab_verano_16.
    DATA lv_importe TYPE i.

    SELECT SINGLE * FROM ztab_verano_16 WHERE id_reserva = @i_reserva INTO @ls_reservas.

    IF sy-subrc <> 0.
      rv_respuest = 'Error: no existe ninguna reserva con ese ID'.
      RETURN.
    ENDIF.
    "recalcular el importe.

    lv_importe = 100 + ( i_numacticontra * 25 ) + ( i_numdiasacti * 40 ).

    UPDATE ztab_verano_16 SET nombre_cliente = @i_nom,
                          apellido_cliente = @i_apell,
                          telefono = @i_telef,
                          importe_total = @lv_importe
                          WHERE id_reserva = @i_reserva.

    IF sy-subrc = 0.
      rv_respuest = 'Reserva modificada correctamente'.
    ELSE.
      rv_respuest = 'Error al modificar la reserva'.
    ENDIF.
  ENDMETHOD.

  METHOD cons_reserva.

    IF i_reserva = 0. "devuelve todos los registros.
      SELECT * FROM ztab_verano_16 order by id_reserva INTO TABLE @rt_reservas.

    ELSE. "devuelve los de la reserva consultada.

      SELECT * FROM ztab_verano_16 WHERE id_reserva = @i_reserva INTO TABLE @rt_reservas.

    ENDIF.

  ENDMETHOD.

  METHOD cons_registros.

  SELECT * FROM ztab_verano_16 ORDER BY id_reserva INTO TABLE @rt_reservas.

    " Recorta la tabla si tiene más de N filas
    IF lines( rt_reservas ) > i_cuantos.
      DELETE rt_reservas FROM i_cuantos + 1.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
