CLASS zcl_emptemp_16 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado16
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  data: em_horas type i value 25,
        em_preciohoras type i value 10.


        METHODS:
      calcular_salario
        REDEFINITION,
      get_ficha
        REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_emptemp_16 IMPLEMENTATION.
  method calcular_salario.
        rv_importe = em_sal_base + ( em_horas * em_preciohoras ).
  endmethod.

  method get_ficha.
        data(lv_ficha_tot) = super->get_ficha( ).

        rs_ficha = |{ lv_ficha_tot } | &
               |Horas Trabajadas: { em_horas } | &
               |Precio x hora: { em_preciohoras } |.
  endmethod.

ENDCLASS.

"como lo ha hecho luis

*CLASS zcl_empleadot_00 DEFINITION
*  PUBLIC
*  INHERITING FROM zcl_empleado_00
*  FINAL
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*
*    DATA:
*          horas_t TYPE i,
*          precio_h type i.
*
*    METHODS:
*      constructor IMPORTING
*                    i_nombre     TYPE string
*                    i_dni        TYPE string
*                    i_salario    TYPE i
*                    i_horas_t    TYPE i
*                    i_precio_h   type i,
*      calcula_salario REDEFINITION,
*      mostrar_ficha REDEFINITION.
*
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*ENDCLASS.
*
*
*CLASS zcl_empleadot_00 IMPLEMENTATION.
*
*  METHOD constructor.   " izq - parametro del metodo constructor del padre
*                        " der - parametro del metodo constructor del hijo
*
*    super->constructor(  i_nombre = i_nombre
*                         i_dni = i_dni
*                         i_salario = i_salario ).
*
*    me->horas_t = i_horas_t.
*    me->precio_h = i_precio_h.
*  ENDMETHOD.
*
*  METHOD calcula_salario.
*
*    rv_salario = me->salario + ( me->horas_t * me->precio_h ).
*
*  ENDMETHOD.
*
*  METHOD mostrar_ficha.
*
*    o_ficha = | El empleado { me->nombre } | &&
*          | con DNI { me->dni } | &&
*          | cobra de base { me->salario } | &&
*          | ha trabajado { me->horas_t } | &&
*          | con una tarifa de { me->precio_h } precio/hora | &&
*          | por lo tanto cobra { me->calcula_salario( ) } euros |.
*
*  ENDMETHOD.
*
*ENDCLASS.
