CLASS zcl_tabla_alum16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:

      " Campo a campo, hago referencia al data element.
      insertar_1 IMPORTING
                   "i_dni type zalumnos_16-dni se puede declarar asi tambien
                   i_dni       TYPE zdni_16
                   i_nombre    TYPE znombre_16
                   i_fecha_nac TYPE zfecha_16
                   i_curso     TYPE zcurso_16
                   i_nota      TYPE znota_16
                 EXPORTING
                   o_valido    TYPE abap_bool,

      " Estuctura del tirón, es mas practico.
      insertar_2 IMPORTING
                   i_alumnos TYPE zalumnos_16
                 EXPORTING
                   o_valido  TYPE abap_bool.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_tabla_alum16 IMPLEMENTATION.

  METHOD insertar_1.

    " Declaración de la estructura
    DATA ls_alumnos TYPE zalumnos_16.

    " Asignación de los valores de entrada
    ls_alumnos-dni = i_dni.
    ls_alumnos-nombre = i_nombre.
    ls_alumnos-fecha_nac = i_fecha_nac.
    ls_alumnos-curso = i_curso.
    ls_alumnos-nota = i_nota.

    " Se añade a la BD
    INSERT zalumnos_16 FROM @ls_alumnos.
    " Esta comprobación indica si ha ido bien o mal
    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD insertar_2.

    " Se añade a la BD
    INSERT zalumnos_16 FROM @i_alumnos.
    " Esta comprobación indica si ha ido bien o mal
    IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
