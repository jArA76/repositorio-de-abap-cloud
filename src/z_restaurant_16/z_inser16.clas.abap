CLASS z_inser16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_inser16 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*        SELECT * FROM zreceta_00 into table @DATA(tabla).
*        insert zreceta_16 from table @tabla.

 SELECT * FROM zingrediente_00 into table @DATA(tabla).
 insert zingrediente16 from table @tabla.

    out->write( tabla ).
  ENDMETHOD.

ENDCLASS.
