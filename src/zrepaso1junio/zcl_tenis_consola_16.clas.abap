CLASS zcl_tenis_consola_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tenis_consola_16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lo_torneo    TYPE REF TO zcl_torneo_tenis_16.
    DATA lo_j1        TYPE REF TO zcl_jugador_profesional_16.
    DATA lo_j2        TYPE REF TO zcl_jugador_profesional_16.
    DATA lo_j3        TYPE REF TO zcl_jugador_amateur_16.
    DATA lo_j4        TYPE REF TO zcl_jugador_amateur_16.
    DATA lo_lider     TYPE REF TO zcl_jugador_base_16.
    DATA lt_clasif    TYPE string_table.
    DATA lv_linea     TYPE string.

    "cl_demo_output=>new( )->begin_section( 'Torneo de Tenis — Debug Exercise' ).
 "   out->write( 'Torneo de Tenis — Debug Exercise' ).

    TRY.
      lo_torneo = NEW zcl_torneo_tenis_16( iv_nombre_torneo =  'Roland Garros 2026' ).


      lo_j1 = NEW zcl_jugador_profesional_16(
                iv_nombre = 'Alcaraz'
                iv_pais   = 'ESP'
                iv_ranking_inicial = 1 ).

      lo_j2 = NEW zcl_jugador_profesional_16(
                iv_nombre = 'Sinner'
                iv_pais   = 'ITA'
                iv_ranking_inicial = 2 ).

      lo_j3 = NEW zcl_jugador_amateur_16(
                iv_nombre = 'Garcia'
                iv_pais   = 'ESP'
                iv_club   = 'Club Sevilla' ).

      lo_j4 = NEW zcl_jugador_amateur_16(
                iv_nombre = 'Lopez'
                iv_pais   = 'ESP'
                iv_club   = 'Club Huelva' ).

      lo_torneo->registrar_jugador( lo_j1 ).
      lo_torneo->registrar_jugador( lo_j2 ).
      lo_torneo->registrar_jugador( lo_j3 ).
      lo_torneo->registrar_jugador( lo_j4 ).

      lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Alcaraz'
        iv_nombre_perdedor = 'Sinner'
        iv_sets_ganador    = 3
        iv_sets_perdedor   = 1 ).

      lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Alcaraz'
        iv_nombre_perdedor = 'Garcia'
        iv_sets_ganador    = 3
        iv_sets_perdedor   = 0 ).

      lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Sinner'
        iv_nombre_perdedor = 'Lopez'
        iv_sets_ganador    = 3
        iv_sets_perdedor   = 2 ).

      lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Garcia'
        iv_nombre_perdedor = 'Lopez'
        iv_sets_ganador    = 2
        iv_sets_perdedor   = 1 ).

        lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Sinner'
        iv_nombre_perdedor = 'Alcaraz'
        iv_sets_ganador    = 4
        iv_sets_perdedor   = 2 ).

        lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Garcia'
        iv_nombre_perdedor = 'Alcaraz'
        iv_sets_ganador    = 3
        iv_sets_perdedor   = 2 ).

        lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Garcia'
        iv_nombre_perdedor = 'Alcaraz'
        iv_sets_ganador    = 3
        iv_sets_perdedor   = 2 ).

      lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Lopez'
        iv_nombre_perdedor = 'Alcaraz'
        iv_sets_ganador    = 3
        iv_sets_perdedor   = 1 ).

      lo_torneo->registrar_partido(
        iv_nombre_ganador  = 'Alcaraz'
        iv_nombre_perdedor = 'Lopez'
        iv_sets_ganador    = 3
        iv_sets_perdedor   = 1 ).

      out->write( |Torneo: { lo_torneo->get_nombre_torneo( ) }| ).
      out->write( '--- CLASIFICACION ---' ).

      lt_clasif = lo_torneo->get_clasificacion( ).
      LOOP AT lt_clasif INTO lv_linea.
        out->write( lv_linea ).
      ENDLOOP.

      lo_lider = lo_torneo->get_lider( ).
      out->write( |Lider: { lo_lider->get_nombre( ) } de { lo_lider->get_pais( ) }| ).

      " Prueba clasificado
      IF lo_lider->zif_clasificable_16~esta_clasificado( ) = abap_true.
        out->write( |{ lo_lider->get_nombre( ) } esta clasificado para la final| ).
      ELSE.
        out->write( |{ lo_lider->get_nombre( ) } NO esta clasificado aun| ).
      ENDIF.

    CATCH zcx_tenis_error_16 INTO DATA(lx_err).
      out->write( |ERROR: { lx_err->mv_mensaje }| ).
    ENDTRY.

    "cl_demo_output=>display( ).


  ENDMETHOD.
ENDCLASS.
