CLASS zcl_calc_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calc_jara IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  data lv_num1 type i.
  data lv_num2 type i.
  data lv_result type p decimals 2.
  data lv_oper type string.
  lv_num1 = 8.
  lv_num2 = 0.
  lv_oper = '/'.


  case lv_oper.

    when '/'.
     try.
     lv_result = lv_num1 / lv_num2.
     out->write( |{ lv_num1 } / { lv_num2 } = { lv_result } | ).
     catCH cx_sy_zerodivide.
     out->write( 'no se puede divir entre 0' ).
     endtry.
    when '+'.
    lv_result = lv_num1 + lv_num2.
    out->write( |{ lv_num1 } + { lv_num2 } = { lv_result } | ).

    when '-'.
    lv_result = lv_num1 - lv_num2.
    out->write( |{ lv_num1 } - { lv_num2 } = { lv_result } | ).

    when '*'.
    lv_result = lv_num1 * lv_num2.
    out->write( |{ lv_num1 } * { lv_num2 } = { lv_result } | ).

    when othERS."si es un operador que no se reconoce

    out->write( 'operacion no permitida' ).

    endCASE.





  ENDMETHOD.

ENDCLASS.
