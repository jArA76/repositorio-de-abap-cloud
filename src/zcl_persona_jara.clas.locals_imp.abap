*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS zcl_demo_persona DEFINITION.

  PUBLIC SECTION.
  "definicion de atributos
  "definicion de metodos.

    DATA:
      titular TYPE string,
      saldo TYPE i.

    METHODS:
    constructor
      IMPORTING i_titular TYPE string
                i_saldo   TYPE i,

*      set_saldo
*        IMPORTING
*          i_saldo TYPE i,

      get_titular  "consulto el titular para devolverlo
        EXPORTING
          o_titular TYPE string,

      set_titular
        IMPORTING
          i_titular TYPE string,

      get_saldo
        EXPORTING
          o_saldo TYPE i,

        ingresar imporTING i_cantidad type i,  "le decimos la cantidad que quiere ingresar, recibe i_cantidad.
        retirar impoRTING i_cantidad type i   "le decimos la cantidad que quiere sacar.
        EXPORTING o_valido   TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_demo_persona IMPLEMENTATION.

   method constructor.
    titular = i_titular. "mete en titular el valor de i_titular
    saldo = i_saldo.
  ENDMETHOD.

  METHOD set_titular.
    " atributo = parametro de entrada
    titular = i_titular.
  ENDMETHOD.

  METHOD get_titular.
    " parametro de salida = atributo
    o_titular = titular.
  ENDMETHOD.

*    METHOD set_saldo.
*    " atributo = parametro de entrada
*    saldo = i_saldo.
*  ENDMETHOD.

  METHOD get_saldo.
    " parametro de salida = atributo
    o_saldo = saldo.
  ENDMETHOD.

  method ingresar.
  saldo = saldo + i_cantidad.
  endmethod.

  method retirar.
  if saldo >= i_cantidad.
    saldo = saldo - i_cantidad.
    else.
    o_valido = abap_false.
  endif.
  endmethod.
ENDCLASS.
