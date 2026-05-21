CLASS zcl_consola_alum16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONSOLA_ALUM16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
 " Tabla y Clase Alumnos

    DATA(lo_alumnos) = NEW zcl_tabla_alum16( ).
    DATA lv_valido TYPE abap_bool.

    lo_alumnos->insertar_1(
        EXPORTING
            i_dni = '12345678C'
            i_nombre = 'LuisCa'
            i_fecha_nac = '19870502'
            i_curso = 'ABAP'
            i_nota = 10
        IMPORTING
            o_valido = lv_valido ).

    " Esta comprobación indica si ha ido bien o mal
    IF lv_valido = abap_true. " Ha ido bien
      out->write( 'Inserción correcta' ).
    ELSE.
      out->write( 'Inserción incorrecta' ).
    ENDIF.
"hago una segunda insercion.
    lo_alumnos->insertar_1(
        EXPORTING
            i_dni = '12345678F'
            i_nombre = ' '
            i_fecha_nac = '19870502'
            i_curso = 'Mates'
            i_nota = 10
        IMPORTING
            o_valido = lv_valido ).

    " Esta comprobación indica si ha ido bien o mal
    IF lv_valido = abap_true. " Ha ido bien
      out->write( 'Inserción correcta' ).
    ELSE.
      out->write( 'Inserción incorrecta' ).
    ENDIF.

    "para la segunda manera de insercion
    " Declaro la estructura
    DATA ls_alumnos TYPE zalumnos_16.

    " Le meto los datos
        ls_alumnos = VALUE #(
        dni = '12345678G'
        nombre = 'LuisCa'
        fecha_nac = '19870502'
        curso = 'ABAP'
        nota = 10 ).

    " Llamo al método
    lo_alumnos->insertar_2(
        EXPORTING i_alumnos = ls_alumnos
        IMPORTING o_valido = lv_valido ).

    " Comprobación
    IF lv_valido = abap_true. " Ha ido bien
      out->write( 'Inserción correcta' ).
    ELSE.
      out->write( 'Inserción incorrecta' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
