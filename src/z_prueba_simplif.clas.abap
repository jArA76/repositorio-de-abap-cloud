CLASS z_prueba_simplif DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_prueba_simplif IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " 1. Obtener tabla de objetos
    DATA(lt_flights) = lcl_flight=>get_flights( ).

    " 2. Recorrer la tabla
    LOOP AT lt_flights INTO DATA(lo_flight).

      " 3. Obtener datos básicos
      out->write( |Flight: { lo_flight->carrier_id } { lo_flight->connection_id }| ).

      " 4. Llamar al método de estructura
      DATA(ls_details) = lo_flight->get_connection_details( ).

      " 5. Mostrar datos de la estructura
      out->write( |From: { ls_details-airport_from } To: { ls_details-airport_to }| ).

      out->write( '----------------------' ).

    ENDLOOP.



  ENDMETHOD.
ENDCLASS.
