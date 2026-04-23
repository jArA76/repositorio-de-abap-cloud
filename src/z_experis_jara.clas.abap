class Z_EXPERIS_JARA definition
  public
  final
  create public.

public section.
INTERFACES if_oo_adt_classrun.
protected section.
private section.

ENDCLASS.

CLASS Z_EXPERIS_JARA IMPLEMENTATION.
  METHOD IF_OO_ADT_CLASSRUN~MAIN.
*  data lv_lca type i.
*  data lv_scar type c.
*data(lv_edad) = 8.
*if ( lv_edad < 10 ).
*
*endif.
"probando el control de errores

*   data lv_resultado type i.
*
*   TRY.
*   lv_resultado = 7 / 0.
*   out->write( lv_resultado ).
*   catch cx_sy_zerodivide.
*   out->write( 'error en division' ).
*endtrY.

"probando el do

data lv_cuenta type i.

*do.
*lv_cuenta = lv_cuenta + 1.
*out->write( lv_cuenta ).
* if lv_cuenta >= 8.
*   out->write( 'me salgo.....' ).
*   exit.
*   endIF.
*   endDO.
do.
lv_cuenta = sy-index.
data(lv_resto) = lv_cuenta mod 2.
if ( lv_resto = 0 ).
continue.
endIF.

out->write( lv_cuenta ).

if lv_cuenta >= 10.
exit.
endIF.

endDO.





  ENDMETHOD.

ENDCLASS.
