CLASS z_inserciones16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PRIVATE SECTION.
    METHODS:
      insert_duenos   IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      insert_perros   IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      insert_paseadores IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      insert_servicios  IMPORTING out TYPE REF TO if_oo_adt_classrun_out,
      insert_valoraciones IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.

CLASS z_inserciones16 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    insert_duenos( out ).
    insert_perros( out ).
    insert_paseadores( out ).
    insert_servicios( out ).
    insert_valoraciones( out ).
    out->write( '✔ Carga completa finalizada' ).
  ENDMETHOD.


  METHOD insert_duenos.
    DATA lt_duenos TYPE TABLE OF zdueno.

    lt_duenos = VALUE #(
      ( client = sy-mandt  id_dueno = '000001'
        nombre = 'Carlos'   apellidos = 'García López'
        telefono = '600111222'  email = 'carlos@email.com'
        direccion = 'Calle Mayor 1, Sevilla' )

      ( client = sy-mandt  id_dueno = '000002'
        nombre = 'María'    apellidos = 'Fernández Ruiz'
        telefono = '611222333'  email = 'maria@email.com'
        direccion = 'Avenida Sur 45, Sevilla' )

      ( client = sy-mandt  id_dueno = '000003'
        nombre = 'Pedro'    apellidos = 'Martínez Sánchez'
        telefono = '622333444'  email = 'pedro@email.com'
        direccion = 'Plaza España 3, Sevilla' )
    ).

    DELETE FROM zdueno.                        " limpia antes de insertar
    INSERT zdueno FROM TABLE @lt_duenos.

    IF sy-subrc = 0.
      out->write( |✔ Dueños insertados: { lines( lt_duenos ) }| ).
    ELSE.
      out->write( '✘ Error insertando dueños' ).
    ENDIF.
  ENDMETHOD.



  METHOD insert_perros.
    DATA lt_perros TYPE TABLE OF zperros.

    lt_perros = VALUE #(
      ( client = sy-mandt  id_perro = '000001'
        nombre = 'Rex'      raza = 'Pastor Alemán'
        tamano = 'G'        fecha_nacimiento = '20200315'
        notas_medicas = 'Alérgico a la penicilina'
        id_dueno = '000001' )

      ( client = sy-mandt  id_perro = '000002'
        nombre = 'Luna'     raza = 'Labrador'
        tamano = 'G'        fecha_nacimiento = '20210608'
        notas_medicas = 'Sin alergias conocidas'
        id_dueno = '000001' )

      ( client = sy-mandt  id_perro = '000003'
        nombre = 'Coco'     raza = 'Chihuahua'
        tamano = 'P'        fecha_nacimiento = '20190920'
        notas_medicas = 'Revisión cardíaca anual'
        id_dueno = '000002' )

      ( client = sy-mandt  id_perro = '000004'
        nombre = 'Toby'     raza = 'Beagle'
        tamano = 'M'        fecha_nacimiento = '20220101'
        notas_medicas = ''
        id_dueno = '000003' )
    ).

    DELETE FROM zperros.
    INSERT zperros FROM TABLE @lt_perros.

    IF sy-subrc = 0.
      out->write( |✔ Perros insertados: { lines( lt_perros ) }| ).
    ELSE.
      out->write( '✘ Error insertando perros' ).
    ENDIF.
  ENDMETHOD.

 METHOD insert_paseadores.
    DATA lt_paseadores TYPE TABLE OF zpaseador.

    lt_paseadores = VALUE #(
      ( client = sy-mandt  id_paseador = '000001'
        nombre = 'Ana'      apellidos = 'Romero Díaz'
        telefono = '633444555'  email = 'ana@paseos.com'
        zona_cobertura = 'Triana, Nervión'
        tarifa_hora = '12.50'   disponible = 'X' )

      ( client = sy-mandt  id_paseador = '000002'
        nombre = 'Luis'     apellidos = 'Torres Vega'
        telefono = '644555666'  email = 'luis@paseos.com'
        zona_cobertura = 'Macarena, Alameda'
        tarifa_hora = '10.00'   disponible = 'X' )

      ( client = sy-mandt  id_paseador = '000003'
        nombre = 'Sara'     apellidos = 'Molina Reyes'
        telefono = '655666777'  email = 'sara@paseos.com'
        zona_cobertura = 'Los Remedios, Bellavista'
        tarifa_hora = '15.00'   disponible = ' ' )
    ).

    DELETE FROM zpaseador.
    INSERT zpaseador FROM TABLE @lt_paseadores.

    IF sy-subrc = 0.
      out->write( |✔ Paseadores insertados: { lines( lt_paseadores ) }| ).
    ELSE.
      out->write( '✘ Error insertando paseadores' ).
    ENDIF.
  ENDMETHOD.


  METHOD insert_servicios.
    DATA lt_servicios TYPE TABLE OF zservicios.

    lt_servicios = VALUE #(
      ( client = sy-mandt  id_servicio = '00000001'
        id_paseador = '000001'  id_perro = '000001'
        fecha_inicio = '20260501'  hora_inicio = '090000'
        fecha_fin    = '20260501'  hora_fin    = '100000'
        estado = 'CO'  tipo_servicio = 'PA'
        precio_total = '12.50'
        observaciones = 'Paseo por el parque sin incidencias' )

      ( client = sy-mandt  id_servicio = '00000002'
        id_paseador = '000001'  id_perro = '000002'
        fecha_inicio = '20260502'  hora_inicio = '100000'
        fecha_fin    = '20260502'  hora_fin    = '110000'
        estado = 'CO'  tipo_servicio = 'PA'
        precio_total = '12.50'
        observaciones = '' )

      ( client = sy-mandt  id_servicio = '00000003'
        id_paseador = '000002'  id_perro = '000003'
        fecha_inicio = '20260503'  hora_inicio = '080000'
        fecha_fin    = '20260503'  hora_fin    = '090000'
        estado = 'AC'  tipo_servicio = 'PA'
        precio_total = '10.00'
        observaciones = 'Perro nervioso, evitar perros grandes' )

      ( client = sy-mandt  id_servicio = '00000004'
        id_paseador = '000002'  id_perro = '000004'
        fecha_inicio = '20260510'  hora_inicio = '170000'
        fecha_fin    = '20260510'  hora_fin    = '180000'
        estado = 'PE'  tipo_servicio = 'PA'
        precio_total = '10.00'
        observaciones = '' )

      ( client = sy-mandt  id_servicio = '00000005'
        id_paseador = '000001'  id_perro = '000001'
        fecha_inicio = '20260501'  hora_inicio = '090000'
        fecha_fin    = '20260503'  hora_fin    = '090000'
        estado = 'CO'  tipo_servicio = 'GU'
        precio_total = '75.00'
        observaciones = 'Guardería fin de semana' )
    ).

    DELETE FROM zservicios.
    INSERT zservicios FROM TABLE @lt_servicios.

    IF sy-subrc = 0.
      out->write( |✔ Servicios insertados: { lines( lt_servicios ) }| ).
    ELSE.
      out->write( '✘ Error insertando servicios' ).
    ENDIF.
  ENDMETHOD.


  METHOD insert_valoraciones.
    DATA lt_valoraciones TYPE TABLE OF zvaloracion.

    lt_valoraciones = VALUE #(
      ( client = sy-mandt  id_valoracion = '00000001'
        id_servicio = '00000001'
        puntuacion = 5
        comentario = 'Excelente servicio, muy puntual'
        fecha = '20260501' )

      ( client = sy-mandt  id_valoracion = '00000002'
        id_servicio = '00000002'
        puntuacion = 4
        comentario = 'Muy bien, repetiré'
        fecha = '20260502' )

      ( client = sy-mandt  id_valoracion = '00000003'
        id_servicio = '00000005'
        puntuacion = 5
        comentario = 'La guardería perfecta, el perro volvió feliz'
        fecha = '20260503' )
    ).

    " Solo los servicios CO (completados) tienen valoración
    " Los servicios AC y PE no se valoran todavía

    DELETE FROM zvaloracion.
    INSERT zvaloracion FROM TABLE @lt_valoraciones.

    IF sy-subrc = 0.
      out->write( |✔ Valoraciones insertadas: { lines( lt_valoraciones ) }| ).
    ELSE.
      out->write( '✘ Error insertando valoraciones' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
