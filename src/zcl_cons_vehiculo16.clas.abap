CLASS zcl_cons_vehiculo16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cons_vehiculo16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA(lo_vehiculo) = NEW zcl_vehiculo16(
                                i_matricula = '123456789'
                                i_marca = 'Honda'
                                i_anyo = 2000 ).

    DATA(lo_turismo) = NEW zcl_turismo16(
                                i_matricula = '987654321'
                                i_marca = 'Seat'
                                i_anyo = 2001 ).

    DATA(lo_camion) = NEW zcl_camion_16(
                                i_matricula = 'ABC'
                                i_marca = 'Renault'
                                i_anyo = 1999 ).

    out->write( lo_vehiculo->get_ficha( ) ).
    out->write(  '--------------------------' ).
    out->write( lo_turismo->get_ficha( ) ).
    out->write(  '--------------------------' ).
    out->write( lo_camion->get_ficha( ) ).

    out->write(  '--------------------------' ).
    out->write(  '--------------------------' ).

    out->write( lo_vehiculo->calcular_impuesto( ) ).
    out->write(  '--------------------------' ).
    out->write( lo_turismo->calcular_impuesto( ) ).
    out->write(  '--------------------------' ).
    lo_camion->mv_tonelaje = 2.
    out->write( lo_camion->calcular_impuesto( ) ).
  ENDMETHOD.
ENDCLASS.
