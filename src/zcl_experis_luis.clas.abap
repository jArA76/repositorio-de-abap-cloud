CLASS zcl_experis_luis DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
    "data: mv_nombre type string.
    "methods: saludar.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXPERIS_LUIS IMPLEMENTATION.


method if_oo_adt_classrun~main.

*  data lv_id type i value 7.
*
*  IF lv_id MOD 2 = 0.
*     out->write( 'El número es PAR' ) .
*    ELSE.
*            out->write( 'El número es IMPAR' ) .
*  ENDIF.


"otra forma

*data lv_num type i.
*data lv_resto type i.
*
*lv_num = 1.
*
*lv_resto = lv_num mod 2.

*if lv_resto = 0.
*   out->write( 'es par' ).
*else.
*    out->write( 'es impar' ).
*endif.

"una manera mas elaborada

*data lv_cont type i.
*data lv_num type i.
*lv_num = 11.
*
*out->write( | el numero inicial es { lv_num } | ).
*"out->write( lv_num ).
*
*while lv_num >= 2.
*
*lv_cont = lv_cont + 1.
*lv_num = lv_num - 2.
*out->write( | En iteracion { lv_cont } el numero vale { lv_num } | ).
*endWHILE.
*
*if lv_num = 0.
*out->write( 'es par' ).
*
*else.
*    out->write( 'es impar' ).
*endIF.

"otro ejercicio
*data lv_secret type i.
*data lv_muestro type i.
*data lv_cont type i.
*
*lv_secret = 8.
*"out->write( | el numero secreto es { lv_secret } | ).
*
* while lv_cont < lv_secret.
*    out->write( | voy por el numero { lv_cont } | ).
*    lv_cont = lv_cont + 1.
* endwhile.

"dado un numero que muestre la tabla de multiplicar de ese numero

data lv_numcalc type i.
data lv_cont type i.
data lv_resultado type i.
data lv_zum type i.

lv_numcalc = 8.
lv_cont = 1.

while lv_cont <= 10.

   lv_resultado = lv_numcalc * lv_cont.
   out->write( | { lv_numcalc } x { lv_cont } = { lv_resultado } | ).
   lv_cont = lv_cont + 1.
   lv_zum = lv_zum + lv_resultado.

endwhile.

out->write( | el total es: { lv_zum } | ).

ENDMETHOD.
ENDCLASS.
