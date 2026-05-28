CLASS zrepaso_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zrepaso_16 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**  Variable = Identificador + Tipo + Valor (que puede cambiar)
*
*    " Dos formas de declarar variable
*    DATA lv_variable TYPE i. " Se declara sin valor
**    DATA lv_variable TYPE i VALUE 5. " Se declara con valor
*    lv_variable = 10.
*
*    " Declaración inline. Recibe el tipo y el valor en la asignación
*    DATA(lv_variable_inline) = 10.
*
**    Constante = Identificador + Tipo + Valor (que NO cambia)
*    CONSTANTS lc_constante TYPE i VALUE 20.
*
**    Elemento de dato:
*    DATA lv_elemdat TYPE zrepaso.
*    lv_elemdat = '12345678901'.
*    CONSTANTS lc_constante_2 TYPE zrepaso VALUE '12345678901'.
*
**    Dominio: Conjunto de valores
*
***********************************************************************
*
**    Diferencia entre variable y estructura
**    Variable: Solo tiene un valor
**    Estructura: Tiene uno o varios campos
*
*    TYPES: BEGIN OF ty_estructura,
*             nombre   TYPE string,
*             apellido TYPE string,
*           END OF ty_estructura.
*
*    DATA ls_estructura TYPE ty_estructura.
*    ls_estructura-nombre = 'LuisCa'.
*    ls_estructura-apellido = 'Pérez'.
**    ls_estructura-edad = 39.
*
*    DATA ls_persona TYPE zestructura.
*    ls_persona-nombre = 'Emilia'.
*    ls_persona-apellido = 'Corchos'.
***    ls_persona-edad = 120.
*
**   Diferencia entre estructura y tabla
**    La estructura es un registro
**    La tabla contiene uno o más registros
*
*    DATA ls_persona2 TYPE zestructura.
*    ls_persona2-nombre = 'Emilia'.
*    ls_persona2-apellido = 'Corchos'.
*
*    DATA lt_personas TYPE TABLE OF zestructura.
*    APPEND ls_persona2 TO lt_personas.
*    APPEND ls_persona2 TO lt_personas.
*
*
*    DATA ls_tablar1 TYPE ztabla_16.
*    DATA lt_tablar1 TYPE TABLE OF ztabla_16.
*    ls_tablar1-nombre = 'Emiliano'.
*    ls_tablar1-apellido = 'butrageño'.
*    APPEND ls_tablar1 TO lt_tablar1. " Almaceno en tabla interna
*
*    INSERT ztabla_16 from @ls_tablar1.
*    "se puede hacer tambien INSERT ztabla_16 from table @lt_tablar1.
*    IF sy-subrc = 0.
*      out->write( 'OK' ).
*    ELSE.
*      out->write( 'Fallo' ).
*    ENDIF.

  DATA lt_insertar TYPE table of zejer2.


  "lt_insertar = VALUE #( ( comu_auto = 'andalucia' ) ( provincia = 'sevilla' ) ( nom_calle = 'trigueros' ) ( cod_postal = 41212 )  ( telefono = 71273 ) ).

  lt_insertar = VALUE #(
  (
    comu_auto  = 'andalucia'
    provincia  = 'huelva'
    nom_calle  = 'onuba'
    cod_postal = 41272
    telefono   = 71120013
  )

  ( comu_auto = 'andalucia'
    provincia = 'cadiz'
    nom_calle = 'lorca'
    cod_postal = 421211
    telefono   = 711233
  )

  ( comu_auto = 'andalucia'
    provincia = 'malaga'
    nom_calle = 'ginebra'
    cod_postal = 41271
    telefono = 999999 )

).
"prueba con el insert.
"insert zejer2 from table @lt_insertar.

"prueba con el update.
"update zejer2 set provincia = 'huelva2', nom_calle = 'choco' where provincia = 'huelva'.

"delete from zejer2 where provincia = 'huelva2'.

"si no existe crea el registro.

"modify zejer2 from table @lt_insertar.




  ENDMETHOD.
ENDCLASS.
