CLASS zcl_bombilla_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BOMBILLA_JARA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data(lo_bombilla) = new zcl_demo_bombilla( i_sitio = 'salon' i_estado = 'apagada' ). "creo el objeto lo_bombilla y le paso al constructor 2 variables.
  data lv_estado type string.
  data lv_ubicacion type string.



   lo_bombilla->get_estado( importing o_estado = lv_estado ).  "cuando llamas a get_Estado importas o_estado y lo pasas a lv_estado
   lo_bombilla->get_ubicacion( importing o_ubicacion = lv_ubicacion ).
   out->write( |La bombilla del: { lv_ubicacion } esta: { lv_estado } | ).

   lo_bombilla->encender( exporting i_encend = 'encender' ).
   lo_bombilla->get_estado( importing o_estado = lv_estado ).
   out->write( |La bombilla del: { lv_ubicacion } esta: { lv_estado } | ).

   lo_bombilla->encender( exporting i_encend = 'encender' ).
   if lv_estado = 'encendida'.
        out->write( 'no se puede encender de nuevo, ya lo esta.' ).
   endIF.

   lo_bombilla->apagar( exporting i_encend = 'apagar' ).
   lo_bombilla->get_estado( importing o_estado = lv_estado ).
   out->write( |La bombilla del: { lv_ubicacion } esta: { lv_estado } | ).

    out->write( '---------------------' ).

   lo_bombilla->set_ubicacion( exporting i_Ubicacion = 'cuarto de baño' ).
   lo_bombilla->get_ubicacion( importing o_ubicacion = lv_ubicacion ).
   lo_bombilla->encender( exporting i_encend = 'encender' ).
   lo_bombilla->get_estado( importing o_estado = lv_estado ).
   out->write( |La bombilla del: { lv_ubicacion } esta: { lv_estado } | ).
  ENDMETHOD.
ENDCLASS.
