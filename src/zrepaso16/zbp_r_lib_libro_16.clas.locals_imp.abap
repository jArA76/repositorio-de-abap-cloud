CLASS LHC_ZR_LIB_LIBRO_16 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrLibLibro16
        RESULT result,
      validalibro FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrLibLibro16~validalibro,

    calculaestado FOR DETERMINE ON MODIFY
  IMPORTING keys FOR ZrLibLibro16~calculaestado.




ENDCLASS.

CLASS LHC_ZR_LIB_LIBRO_16 IMPLEMENTATION.


  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.


  METHOD validalibro.


    " 1. Leemos los datos de los animales que están siendo creados
    READ ENTITIES OF zr_lib_libro_16 IN LOCAL MODE
      ENTITY ZrLibLibro16
        FIELDS ( NumPaginas )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_libro)
      FAILED DATA(lt_failed).

    " 2. Recorremos cada animal y comprobamos el peso
    LOOP AT lt_libro INTO DATA(ls_libro).

      IF ls_libro-NumPaginas < 10.

        " 3. Si el peso es menor o igual a 1kg, reportamos error
        APPEND VALUE #(
          %tky = ls_libro-%tky
        ) TO failed-ZrLibLibro16.

        APPEND VALUE #(
          %tky        = ls_libro-%tky
          %state_area = 'Valida_paginas'
          %msg        = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = 'El libro debe tener al menos 10 paginas'
                        )
        ) TO reported-ZrLibLibro16.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD calculaestado.
  " 1. Leemos el número de páginas
  READ ENTITIES OF zr_lib_libro_16 IN LOCAL MODE
    ENTITY ZrLibLibro16
      FIELDS ( NumPaginas )
      WITH CORRESPONDING #( keys )
    RESULT DATA(lt_libro).

  " 2. Calculamos el estado según las páginas
  LOOP AT lt_libro INTO DATA(ls_libro).

    if  ls_libro-NumPaginas < 50.
      data(lv_estado) = 'Muy deteriorado'.
    ELSEIF ls_libro-NumPaginas < 150.
      lv_estado = 'Deteriorado'.
    ELSEIF ls_libro-NumPaginas < 400.
      lv_estado = 'Bueno'.
    ELSE.
      lv_estado = 'Nuevo'.
    ENDIF.



    " 3. Actualizamos el campo Estado
    MODIFY ENTITIES OF zr_lib_libro_16 IN LOCAL MODE
      ENTITY ZrLibLibro16
        UPDATE FIELDS ( Estado )
        WITH VALUE #( (
          %tky   = ls_libro-%tky
          Estado = lv_estado
        ) ).
  ENDLOOP.
ENDMETHOD.







ENDCLASS.
