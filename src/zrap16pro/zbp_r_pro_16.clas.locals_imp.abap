CLASS LHC_ZR_PRO_16 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrPro16
        RESULT result,
      modificarCampo FOR MODIFY
        IMPORTING keys FOR ACTION ZrPro16~modificarCampo
        RESULT    result.
ENDCLASS.

CLASS LHC_ZR_PRO_16 IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.

   METHOD modificarCampo.

    " 1. Leer los registros actuales para obtener el salario
    READ ENTITIES OF zr_pro_16 IN LOCAL MODE
      ENTITY ZrPro16
        FIELDS ( Salario )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_profesionales)
      FAILED failed.

    " 2. Modificar con el salario duplicado
    MODIFY ENTITIES OF zr_pro_16 IN LOCAL MODE
      ENTITY ZrPro16
        UPDATE FIELDS ( Salario )
        WITH VALUE #(
          FOR ls_prof IN lt_profesionales
          (
            %tky    = ls_prof-%tky
            Salario = ls_prof-Salario * 2
          )
        )
      FAILED failed
      REPORTED reported.

    result = VALUE #(
      FOR ls_prof IN lt_profesionales
      (
        %tky   = ls_prof-%tky
        %param = ls_prof
      )
    ).


  ENDMETHOD.
ENDCLASS.
