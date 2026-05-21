CLASS z_calculodwm16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS Z_CALCULODWM16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data origen_d type d.
  origen_d = '19760630'.
  data(destino_d) = cl_abap_context_info=>get_system_date( ).

  data dias type i.
  data semanas type i.
  data meses type i.
  data anyo type i.

  dias = destino_d - origen_d.

semanas = dias / 7.
meses = dias / 30.
anyo = dias / 365.

out->write( |Desde tu fecha de nacimiento han pasado | &&
            |{ dias } dias, { meses } meses, | &&
            |{ semanas } semanas y { anyo } años.| ).

  ENDMETHOD.
ENDCLASS.
