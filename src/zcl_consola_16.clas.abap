CLASS zcl_consola_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_consola_16 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    data lv_titulo type string.
    data lv_ano type i.
    data lv_estado type string.

  DATA(lo_cuadro) = NEW zcl_cuadro_16( i_tituloc = 'La maja desnuda' i_anoc = 1800 ).

  lo_cuadro->mostrar_ficha( importing o_titulo = lv_titulo o_ano = lv_ano o_esta = lv_estado ).

  out->write( | { lv_titulo } { lv_ano } { lv_estado } | ).

  "voy a modificar el año
  lo_cuadro->set_ano( exporting i_ano = 1801 ). "le digo a i_ano que sea el 1801.

  lo_cuadro->mostrar_ficha( importing o_titulo = lv_titulo o_ano = lv_ano o_esta = lv_estado ).

  out->write( | Título: { lv_titulo }  / Año:{ lv_ano } / Estado:{ lv_estado } | ).

  "creo un segundo cuadro que se llame las meninas y le pongo el año 1656.

  DATA(lo_cuadro2) = NEW zcl_cuadro_16( i_tituloc = 'Las meninas' i_anoc = 1656 ). "me creo otra instancia, otro objeto.

  lo_cuadro2->mostrar_ficha( importing o_titulo = lv_titulo o_ano = lv_ano o_esta = lv_estado ).

  out->write( | Título: { lv_titulo }  / Año:{ lv_ano } / Estado:{ lv_estado } | ).

  ENDMETHOD.
ENDCLASS.
