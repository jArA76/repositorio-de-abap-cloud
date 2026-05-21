CLASS zcl_cuadro_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
        methoDS:
        constructor
          importing
            i_tituloc type string
            i_anoc type i,

            get_titulo exporting o_titulo type string,
            get_ano exporting o_ano type i,

            set_titulo impoRTING i_titulo type string,
            set_ano imPORTING i_ano type i,

            esta_en_exposicion exporting o_esta type abap_bool,
            mostrar_ficha exporting o_titulo type string
                            o_ano type i
                            o_esta type string.  "devuelve si o_esta es mayor de 1800 en exposicion, si es menor esta almacenado.


  PROTECTED SECTION.
  PRIVATE SECTION.
  data: titulo type string,
        ano type i.
ENDCLASS.



CLASS ZCL_CUADRO_16 IMPLEMENTATION.


  METHOD constructor.
    titulo = i_tituloc.
    ano = i_anoc.
  ENDMETHOD.


  method get_titulo. "mete lo que haya en titulo y lo pasa a o_titulo, exporta o_titulo.
    o_titulo = titulo.
  endmethod.


  method get_ano. "exporta o_ano.
    o_ano = ano.
  endmethod.


  method set_titulo.
    titulo = i_titulo.
  endmethod.


  method set_ano.
    ano = i_ano.
  endmethod.


  method esta_en_exposicion.
    if ano > 1800.
      o_esta = abap_true.
    else.
      o_esta = abap_false.
    endif.
  endmethod.


  method mostrar_Ficha.
    o_titulo = titulo.
    o_ano = ano.
    if ano > 1800.
      o_esta = 'En exposicion'.
    else.
      o_esta = 'Almacenado'.
    endif.
  endmethod.
ENDCLASS.
