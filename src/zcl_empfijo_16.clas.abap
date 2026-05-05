CLASS zcl_empfijo_16 DEFINITION
  PUBLIC
  INHERITING FROM zcl_empleado16
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  data:
      em_anyoempresa type i value 8.
    "em_sal_base type i,  em_sal_total type i

      METHODS:
      calcular_salario reDEFINITION,
      get_ficha
        REDEFINITION.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_empfijo_16 IMPLEMENTATION.
method get_ficha.
        data(lv_ficha_tot) = super->get_ficha( ).

        rs_ficha = |{ lv_ficha_tot } | &
               |Años en la empresa: { em_anyoempresa } | .
endmethod.

method calcular_salario.

rv_importe = em_sal_base + ( ( em_anyoempresa ) * 50 ) .

enDMETHOD.

ENDCLASS.
"como lo ha hecho luis

*CLASS zcl_empleadof_00 DEFINITION
*  PUBLIC
*  INHERITING FROM zcl_empleado_00
*  FINAL
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*
*    DATA:
*          antiguedad TYPE i.
*
*    METHODS:
*      constructor IMPORTING
*                    i_nombre     TYPE string
*                    i_dni        TYPE string
*                    i_salario    TYPE i
*                    i_antiguedad TYPE i,
*      calcula_salario REDEFINITION,
*      mostrar_ficha REDEFINITION.
*
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*ENDCLASS.
*
*
*CLASS zcl_empleadof_00 IMPLEMENTATION.
*
*  METHOD constructor.
*    super->constructor(  i_nombre = i_nombre
*                         i_dni = i_dni
*                         i_salario = i_salario ).
*
*    me->antiguedad = i_antiguedad.
*  ENDMETHOD.
*
*  METHOD calcula_salario.
*
*    rv_salario = me->salario + ( me->antiguedad * 50 ).
*
*  ENDMETHOD.
*
*  METHOD mostrar_ficha.
*
*    o_ficha = | El empleado { me->nombre } | &&
*          | con DNI { me->dni } | &&
*          | cobra de base { me->salario } | &&
*          | y una antigüedad de { me->antiguedad } | &&
*          | por lo tanto cobra { me->calcula_salario( ) } euros |.
*
*  ENDMETHOD.
*
*ENDCLASS.
