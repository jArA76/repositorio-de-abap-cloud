CLASS zcl_productos_16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  TYPES ty_productos TYPE STANDARD TABLE OF zproductos_16. "para  devolver todos los registros de una tabla interna
                                                            "hay que declarar una variable tipo de la tabla interna.
     methods:
         insertar importing
            id_producto type ZPRODUCTO_id_16
            id_nombre type zproducto_nom_16
            id_categoria type zproducto_cat_16
            id_precio type Zproducto_prc_16
            id_moneda type waers
            id_stock type zproducto_stk_16
            id_activo type zproducto_act_16

            EXPORTING
                   o_valido    TYPE abap_bool,

         buscar importing
            id_producto type ZPRODUCTO_id_16
            EXPORTING
                   o_valido    TYPE abap_bool
                   o_registro type zproductos_16,

         borrar importing
             id_producto type ZPRODUCTO_id_16
            EXPORTING
                   o_valido    TYPE abap_bool,

         actualizar importing
            id_producto type ZPRODUCTO_id_16
            id_nombre type zproducto_nom_16
            id_categoria type zproducto_cat_16
            id_precio type Zproducto_prc_16
            id_moneda type waers
            id_stock type zproducto_stk_16
            id_activo type zproducto_act_16
            EXPORTING
                   o_valido    TYPE abap_bool,

         listar EXPORTING o_tab_productos TYPE ty_productos.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRODUCTOS_16 IMPLEMENTATION.


method insertar.

     data ls_producto type ZPRODUCTOS_16.

      ls_producto-producto_id = id_producto.
      ls_producto-nombre = id_nombre.
      ls_producto-categoria = id_categoria.
      ls_producto-precio = id_precio.
      ls_producto-moneda = id_moneda.
      ls_producto-stock = id_stock.
      ls_producto-activo = id_activo.

      INSERT ZPRODUCTOS_16 from @ls_producto.
      IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
endMETHOD.


method buscar. "busca por un id de producto

      data ls_producto type ZPRODUCTOS_16.
      SELECT SINGLE * FROM ZPRODUCTOS_16 WHERE producto_id = @id_producto  INTO @ls_producto .

      IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
      o_registro = ls_producto.

    ELSE.
      o_valido = abap_false.
    ENDIF.
endMETHOD.


method listar. "lo lista todo.
    select * from zproductos_16 into table @o_tab_productos.
endMETHOD.


method borrar.

      data ls_producto type ZPRODUCTOS_16.

      DELETE FROM ZPRODUCTOS_16 WHERE producto_id = @id_producto.
      IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
endMETHOD.


method actualizar.

      data ls_producto type ZPRODUCTOS_16.

      ls_producto-producto_id = id_producto.
      ls_producto-nombre = id_nombre.
      ls_producto-categoria = id_categoria.
      ls_producto-precio = id_precio.
      ls_producto-moneda = id_moneda.
      ls_producto-stock = id_stock.
      ls_producto-activo = id_activo.

      UPDATE ZPRODUCTOS_16 from @ls_producto.
      IF sy-subrc = 0. " Ha ido bien
      o_valido = abap_true.
    ELSE.
      o_valido = abap_false.
    ENDIF.
endMETHOD.
ENDCLASS.
