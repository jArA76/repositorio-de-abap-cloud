CLASS zcl_bebidas16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BEBIDAS16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DELETE FROM zbebi16.
INSERT zbebi16 FROM TABLE @( VALUE #(
( codigo = '001' nombre = 'Ron Negrita' tipo = 'Ron' origen = 'Cuba' graduacion = 10 precio = '12.7' )
( codigo = '002' nombre = 'Nestea' tipo = 'Refresco' origen = 'USA' graduacion = 0 precio = 1 )
( codigo = '003' nombre = 'Bacardi' tipo = 'Ron' origen = 'ESP' graduacion = 15 precio = '18.8' )
( codigo = '004' nombre = 'Jack Daniels' tipo = 'Guiski' origen = 'USA' graduacion = '16.4' precio = 25 )
( codigo = '005' nombre = 'Voll Damm' tipo = 'Cerveza' origen = 'Alemania' graduacion = '7.4' precio = '0.70' )
( codigo = '006' nombre = 'Praga' tipo = 'Cerveza' origen = 'Chequia' graduacion = '4.5' precio = '1.5' )
) ).
out->write( 'Datos cargados OK' ).





  ENDMETHOD.
ENDCLASS.
