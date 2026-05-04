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
