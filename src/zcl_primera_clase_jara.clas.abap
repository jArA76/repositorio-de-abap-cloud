CLASS zcl_primera_clase_jara DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    data mv_numero type i.
    INTERFACES if_oo_adt_classrun .

         METHODS: leer EXPORTING o_numero TYPE i,
             " recupera el valor del atributo y lo asigna a un parametro

                  escribir IMPORTING i_numero TYPE i.
             " asigna al atributo el valor del parametro

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRIMERA_CLASE_JARA IMPLEMENTATION.


  METHOD leer .
    "parametro = atributo
    o_numero = mv_numero.
  ENDMETHOD.


  METHOD escribir .
    " atributo = parametro
    mv_numero = i_numero.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    DATA lv_numero TYPE i.
    DATA lo_numero TYPE REF TO zcl_primera_clase_jara.

    CREATE OBJECT lo_numero.

    lo_numero->escribir( EXPORTING i_numero = 20 ).
    out->write( lo_numero->mv_numero ).

    lo_numero->leer( IMPORTING o_numero = lv_numero ).
    out->write( lv_numero ).

  ENDMETHOD.
ENDCLASS.
