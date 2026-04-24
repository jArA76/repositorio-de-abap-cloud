CLASS zcl_ejerciciotabla_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejerciciotabla_jara IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
"ejercicio 1
*  types: BEGIN OF ty_prueba,
*        nombre type c length 15,
*        edad type i,
*        ciudad type c length 20,
*        altura type i,
*        peso type i,
*        end of ty_prueba.
*
*
*       "estructura
*
*       data ls_persona type ty_prueba.
*
*       data lt_persona type table of ty_prueba.
*
*       ls_persona-nombre = 'Juan'.
*       ls_persona-edad = 25.
*       ls_persona-ciudad = 'Madrid'.
*       ls_persona-altura = 175.
*       ls_persona-peso = 70.
*
*       append ls_persona to lt_persona.
*
*       ls_persona-nombre = 'Maria'.
*       ls_persona-edad = 23.
*       ls_persona-ciudad = 'caceres'.
*       ls_persona-altura = 160.
*       ls_persona-peso = 55.
*
*       append ls_persona to lt_persona.
*
*       ls_persona-nombre = 'Jose'.
*       ls_persona-edad = 30.
*       ls_persona-ciudad = 'Toledo'.
*       ls_persona-altura = 178.
*       ls_persona-peso = 75.
*
*       append ls_persona to lt_persona.
*
*       ls_persona-nombre = 'antonio'.
*       ls_persona-edad = 27.
*       ls_persona-ciudad = 'Valladolid'.
*       ls_persona-altura = 170.
*       ls_persona-peso = 72.
*
*       append ls_persona to lt_persona.
*
*       ls_persona-nombre = 'Santiago'.
*       ls_persona-edad = 26.
*       ls_persona-ciudad = 'Vigo'.
*       ls_persona-altura = 173.
*       ls_persona-peso = 73.
*
*       append ls_persona to lt_persona.
*
*       ls_persona-nombre = 'Sofia'.
*       ls_persona-edad = 24.
*       ls_persona-ciudad = 'Oviedo'.
*       ls_persona-altura = 168.
*       ls_persona-peso = 58.
*
*       append ls_persona  to lt_persona.
*
*       ls_persona-nombre = 'Cristina'.
*       ls_persona-edad = 28.
*       ls_persona-ciudad = 'Logroño'.
*       ls_persona-altura = 165.
*       ls_persona-peso = 60.
*
*       append ls_persona to lt_persona.
*
*       ls_persona-nombre = 'Victoria'.
*       ls_persona-edad = 29.
*       ls_persona-ciudad = 'Salamanca'.
*       ls_persona-altura = 163.
*       ls_persona-peso = 59.
*
*       append ls_persona to lt_persona.
*
*       ls_persona-nombre = 'Violeta'.
*       ls_persona-edad = 22.
*       ls_persona-ciudad = 'cordoba'.
*       ls_persona-altura = 166.
*       ls_persona-peso = 62.
*
*       append ls_persona to lt_persona.
*
*       ls_persona-nombre = 'Vicente'.
*       ls_persona-edad = 31.
*       ls_persona-ciudad = 'Las Palmas'.
*       ls_persona-altura = 177.
*       ls_persona-peso = 77.
*
*       append ls_persona to lt_persona.
*
*    loop AT lt_persona into ls_persona.
*    endLOOP.
*    out->write( lt_persona ).

"ejercicio 2

"data lt_libros type table of /dmo/booking.

"select * from /dmo/booking into table @lt_libros.
"data ls_libros type /dmo/booking.
"select * from /dmo/booking into table lt_libros.
"loop at lt_libros into ls_libros.
 "out->write( lt_libros ).
"endloop.

"ejercicio 3

data lt_libros type table of /dmo/booking.
data ls_libros type /dmo/booking.
data ls_total type p deciMALS 3.

select * from /dmo/booking where customer_id = '000594' into table @lt_libros.

loop AT lt_libros into ls_libros.
  ls_total = ls_total + ls_libros-flight_price.
endloop.
out->write( lt_libros ).
out->write( |El total para el cliente  000594 es: { ls_total }| ).



















  ENDMETHOD.
ENDCLASS.
