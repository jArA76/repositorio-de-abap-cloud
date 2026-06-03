CLASS lhc_zr_zoo_animal_16 DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS:

      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrZooAnimal16
        RESULT result,

      validatePeso FOR VALIDATE ON SAVE
        IMPORTING keys FOR ZrZooAnimal16~validatePeso,

      setHabitat FOR DETERMINE ON MODIFY
        IMPORTING keys FOR ZrZooAnimal16~setHabitat.

ENDCLASS.

CLASS lhc_zr_zoo_animal_16 IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validatePeso.

    " 1. Leemos los datos de los animales que están siendo creados
    READ ENTITIES OF zr_zoo_animal_16 IN LOCAL MODE
      ENTITY ZrZooAnimal16
        FIELDS ( PesoKg )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_animales)
      FAILED DATA(lt_failed).

    " 2. Recorremos cada animal y comprobamos el peso
    LOOP AT lt_animales INTO DATA(ls_animal).

      IF ls_animal-PesoKg <= 1.

        " 3. Si el peso es menor o igual a 1kg, reportamos error
        APPEND VALUE #(
          %tky = ls_animal-%tky
        ) TO failed-ZrZooAnimal16.

        APPEND VALUE #(
          %tky        = ls_animal-%tky
          %state_area = 'VALIDATE_PESO'
          %msg        = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text     = 'El animal debe pesar más de 1 kg'
                        )
        ) TO reported-ZrZooAnimal16.

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD setHabitat.

    " 1. Leemos la especie de los animales que han cambiado
    READ ENTITIES OF zr_zoo_animal_16 IN LOCAL MODE
      ENTITY ZrZooAnimal16
        FIELDS ( Especie )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_animales2)
      FAILED DATA(lt_failed).

    " 2. Preparamos la tabla de actualizaciones
    DATA lt_update TYPE TABLE FOR UPDATE zr_zoo_animal_16.

    " 3. Recorremos cada animal y calculamos el hábitat
    LOOP AT lt_animales2 INTO DATA(ls_animal).

      DATA(lv_habitat) = SWITCH #( ls_animal-Especie
        WHEN 'Pingüino rey'     THEN 'Ártico     '
        WHEN 'León africano'    THEN 'Sabana     '
        WHEN 'Jirafa'           THEN 'Sabana     '
        WHEN 'Tiburón blanco'   THEN 'Océano     '
        ELSE                         'Desconocido'
      ).

      " 4. Añadimos el animal a la tabla de actualizaciones
      APPEND VALUE #(
        %tky    = ls_animal-%tky
        Habitat = lv_habitat
        %control-Habitat = if_abap_behv=>mk-on
      ) TO lt_update.

    ENDLOOP.

    " 5. Aplicamos todas las actualizaciones de golpe
    MODIFY ENTITIES OF zr_zoo_animal_16 IN LOCAL MODE
      ENTITY ZrZooAnimal16
        UPDATE FIELDS ( Habitat )
        WITH lt_update
      REPORTED DATA(lt_reported).

  ENDMETHOD.

ENDCLASS.

