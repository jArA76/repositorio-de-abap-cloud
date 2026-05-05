CLASS zcl_consempleado16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_consempleado16 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.



  DATA(lo_empleado) = NEW zcl_empleado16(
                                i_nombre = 'Adolfo'
                                i_dni = '12312312B'
                                i_sal_base = 1000 ).

   DATA(lo_empleado_fijo) = NEW zcl_empfijo_16(
                                i_nombre = 'Peter'
                                i_dni = '12316722B'
                                i_sal_base = 1000 ).

    data(lo_empleado_temp) = NEW zcl_emptemp_16(
                                i_nombre = 'Margarita'
                                i_dni = 'N1236722B'
                                i_sal_base = 600 ).



  out->write( lo_empleado->get_ficha( ) ).
  out->write( lo_empleado_fijo->get_ficha( ) ).
  out->write( lo_empleado_temp->get_ficha( ) ).

  ENDMETHOD.
ENDCLASS.

""consola de luis

*DATA(lo_empleado) = NEW zcl_empleado_00(  i_dni = 'A'
*                                              i_salario = 10000
*                                              i_nombre = 'Luis' ).
*
*    lo_empleado->mostrar_ficha( IMPORTING o_ficha = DATA(lv_ficha) ).
*    out->write( lv_ficha ).
*
*
*    DATA(lo_empleadof) = NEW zcl_empleadof_00(  i_dni = 'B'
*                                              i_salario = 10000
*                                              i_nombre = 'Luis'
*                                              i_antiguedad = 5 ).
*
*    lo_empleadof->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).
*
*    DATA(lo_empleadot) = NEW zcl_empleadot_00(  i_dni = 'C'
*                                              i_salario = 10000
*                                              i_nombre = 'Luis'
*                                              i_horas_t = 50
*                                              i_precio_h = 23 ).
*
*    lo_empleadot->mostrar_ficha( IMPORTING o_ficha = lv_ficha ).
*    out->write( lv_ficha ).

