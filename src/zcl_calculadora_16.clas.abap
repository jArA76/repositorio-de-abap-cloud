CLASS zcl_calculadora_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


  methods:
     constructor
         importing
              i_valor type i
              i_nombre type string,

                get_valor exporting o_valor type i,
                get_nombre exporting o_nombre type string,

                set_nombre importing i_nombre type string,

                sumar importing i_valor type i,
                restar importing i_valor type i,
                multiplicar importing i_valor type i,
                dividir importing i_valor type i exporting rv_error type abap_boolean,

                reset .
  PROTECTED SECTION.
  PRIVATE SECTION.
  data: valor type i,
        nombre type string.
ENDCLASS.

CLASS zcl_calculadora_16 IMPLEMENTATION.

method constructor.
valor = i_valor.
nombre = i_nombre.
endmethod.

method get_valor.
o_valor = valor.
endmethod.

method get_nombre.
o_nombre = nombre.
endmethod.

method set_nombre.
nombre = i_nombre.
endmethod.

method sumar.
valor = valor + i_valor.

endmethod.

method restar.

valor = valor - i_valor.

endmethod.

method multiplicar.

valor = valor * i_valor.

endmethod.

method dividir.
if i_valor = 0.
    rv_error = abap_true.
else.
    valor = valor / i_valor.
    rv_error = abap_false.
endif.

endmethod.

method reset.
valor = 0.
endmethod.

ENDCLASS.
