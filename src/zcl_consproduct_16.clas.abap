CLASS zcl_consproduct_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_consproduct_16 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

  DATA(lo_producto) = NEW zcl_productos_16( ).

    DATA lv_valido TYPE abap_bool.
    data lv_registro type zproductos_16.
    data lv_total type table of zproductos_16.

"insertar
    lo_producto->insertar(
        EXPORTING
            id_producto = 000001
            id_nombre = 'cafeina'
            id_categoria = 'bebidas'
            id_precio = '20'
            id_moneda = 'fS'
            id_stock = 41
            id_activo = 'S'
        IMPORTING
            o_valido = lv_valido ).

    " Esta comprobación indica si ha ido bien o mal
    IF lv_valido = abap_true. " Ha ido bien
      out->write( 'Inserción correcta' ).
    ELSE.
      out->write( 'Inserción incorrecta' ).
    ENDIF.

"buscar
*    lo_producto->buscar( exporting id_producto = 21
*    IMPORTING
*            o_valido = lv_valido
*            o_registro = lv_registro ).
*
*    IF lv_valido = abap_true.
*      out->write( 'busqueda ok' ).
*      out->write( lv_registro ).
*    ELSE.
*      out->write( 'no existe el producto' ).
*    ENDIF.
"listar
*        lo_producto->listar( importing o_tab_productos = lv_total  ).
*           out->write( lv_total ).

"borrar
*    lo_producto->borrar( exporting id_producto = 2
*    IMPORTING
*            o_valido = lv_valido ).
*
*    IF lv_valido = abap_true.
*      out->write( 'Borrado ok' ).
*
*    ELSE.
*      out->write( 'Borrado incorrecto' ).
*    ENDIF.

"actualizar
*
*    lo_producto->actualizar(
*        EXPORTING
*            id_producto = 2
*            id_nombre = 'aquaus'
*            id_Categoria = 'bebidas'
*            id_precio = '2'
*            id_moneda = '€'
*            id_stock = 4
*            id_activo = 'S'
*        IMPORTING
*            o_valido = lv_valido ).
*
*    IF lv_valido = abap_true.
*      out->write( 'Actualización correcta' ).
*
*    ELSE.
*      out->write( 'Actualización incorrecta' ).
*
*    ENDIF.

  ENDMETHOD.
ENDCLASS.
