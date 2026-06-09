CLASS zcl_logicaempleado_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES tt_empleado TYPE STANDARD TABLE OF ztab_usuario_ja WITH DEFAULT KEY.

    METHODS:
      constructor
        IMPORTING i_nombre   TYPE zde_nombre_16
                  i_apellido TYPE zde_apellido_16
                  i_tlf      TYPE zde_telefono_16
                  i_exp      TYPE i
                  i_cert     TYPE i,

      calc_sueldo RETURNING VALUE(rv_sueldo) TYPE decfloat16,
      generar_id RETURNING VALUE(rv_id) TYPE i,
      realizar_alta
               RETURNING VALUE(rv_ok) TYPE string,

      modif_emple
        IMPORTING i_id       TYPE zde_id_empleado_16
                  i_nombre   TYPE zde_nombre_16
                  i_apellido TYPE zde_apellido_16
                  i_tlf      TYPE zde_telefono_16
                  i_exp      TYPE i
                  i_cert     TYPE i
                  RETURNING VALUE(rv_respuesta) type string,

      consulta_emp IMPORTING i_id TYPE zde_id_empleado_16 RETURNING VALUE(rv_reg) TYPE tt_empleado,

      consulta_n IMPORTING i_nregistros TYPE i RETURNING VALUE(rv_reg) TYPE tt_empleado.




  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA nombre TYPE zde_nombre_16.
    DATA apellido TYPE zde_apellido_16.
    DATA telefono TYPE zde_telefono_16.
    DATA Experiencia  TYPE i.
    DATA Certificaciones  TYPE i.



ENDCLASS.



CLASS zcl_logicaempleado_16 IMPLEMENTATION.

  METHOD constructor.

    nombre = i_nombre.
    apellido = i_apellido.
    telefono = i_tlf.
    Experiencia = i_exp.
    Certificaciones = i_cert.

  ENDMETHOD.

  METHOD calc_sueldo.

    rv_sueldo = 1000 + ( Certificaciones * 50 ) + ( experiencia * 100 ).

  ENDMETHOD.

  METHOD generar_id.

    DATA cuenta TYPE i.

    SELECT MAX( id_empleado ) FROM ztab_usuario_ja INTO @cuenta.

    IF sy-subrc = 0 AND cuenta IS NOT INITIAL.

      rv_id = cuenta + 1.

    ELSE.

      rv_id = 1.

    ENDIF.

  ENDMETHOD.

  METHOD realizar_alta.

    DATA l_estruc TYPE ztab_usuario_ja.

    l_estruc-id_empleado = generar_id( ).
    l_estruc-nombre = nombre.
    l_estruc-apellido = apellido.
    l_estruc-telefono = telefono.
    l_estruc-sueldo = calc_sueldo( ).

    INSERT ztab_usuario_ja FROM @l_estruc.

    IF sy-subrc = 0.

      rv_ok = |Alta creada correctamente con ID { l_estruc-id_empleado }|.

    ELSE.

      rv_ok = 'Hubo un error en el alta'.

    ENDIF.

  ENDMETHOD.


  METHOD modif_emple.

    DATA lv_into TYPE i.
    DATA calc_sueldo TYPE decfloat16.

    SELECT SINGLE id_empleado FROM ztab_usuario_ja WHERE id_empleado = @i_id INTO @lv_into.

*    IF sy-subrc <> 0.
*      rv_respuesta = 'Error: no existe ningun empleado con ese ID'.
*      RETURN.
*    ENDIF.

    IF sy-subrc = 0.

      calc_sueldo = 1000 + ( Certificaciones * 50 ) + ( experiencia * 100 ).

      UPDATE ztab_usuario_ja
              SET nombre = @i_nombre,
                  Apellido = @i_apellido,
                  Telefono = @i_tlf,
                  sueldo = @calc_sueldo
                  WHERE id_empleado = @i_id.



*   iF sy-subrc = 0.
*      rv_respuesta = 'Empleado modificado correctamente'.
*    ELSE.
*      rv_respuesta = 'Error al modificar empleado'.
*    ENDIF.

    ENDIF.

  ENDMETHOD.

  METHOD consulta_emp.

    IF i_id = 0.

      SELECT * FROM ztab_usuario_ja ORDER BY id_empleado INTO TABLE @rv_reg.

    ELSE.

      SELECT * FROM ztab_usuario_ja WHERE id_empleado = @i_id ORDER BY id_empleado INTO TABLE @rv_reg.


    ENDIF.

  ENDMETHOD.

  METHOD consulta_n.

    SELECT * FROM ztab_usuario_ja ORDER BY id_empleado INTO TABLE @rv_reg UP TO @i_nregistros ROWS.

  ENDMETHOD.
ENDCLASS.
