CLASS zcl_primera_clase_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_primera_clase_jara IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    data lv_id type i value 8.
*
*    data: lv type string,              ""daclara varias variables""
*          lvnamber type i,
*          lv_elementdata type zde_id_jara,
*          lv_tabla type /dmo/agency.
*
*          lv = 'hola'.
*
*          lv_elementdata = 'eso'.
*
*      constants lc_constante type i value 59.     "" para poner comentario a todo es con control < y para quitarlo con control shift < ""
*
*    out->write( | { lv } { lv_elementdata }| ).


  ENDMETHOD.

ENDCLASS.
