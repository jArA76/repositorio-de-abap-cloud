CLASS zcl_ejercicio_dom_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejercicio_dom_jara IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    data lt_book type table of /DMO/BOOKING.
    data ls_book type /DMO/BOOKING.
    data lv_contador type i.

    select * from /dmo/booking where booking_date = '20260107' into table @lt_book.

    IF sy-subrc = 0. "si devuelve registros.

       "select count( * ) from lt_book into @DATA(lv_contador). no se puede hacer un count de una tabla interna.
       loop at lt_book into ls_book.
           lv_contador = lv_contador + 1.
       endloop.
        out->write( lt_book ).
        out->write( |El total de reservas para esa fecha es: { lv_contador } | ).
      ELSE.
        out->write( 'La fecha no existe' ).
      ENDIF.




  ENDMETHOD.

ENDCLASS.
