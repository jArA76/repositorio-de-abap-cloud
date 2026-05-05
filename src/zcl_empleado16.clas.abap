CLASS zcl_empleado16 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA:   em_nombre   TYPE string,
          em_dni       TYPE string,
          em_sal_base TYPE i.

    METHODS:
      constructor IMPORTING i_nombre TYPE string
                            i_dni     TYPE string
                            i_sal_base      TYPE i,

      get_ficha "funcion get ficha que va a devolver un valor
        RETURNING VALUE(rs_ficha) TYPE string,
      calcular_salario
        RETURNING VALUE(rv_importe) TYPE decfloat16.

  PROTECTED SECTION.
   PRIVATE SECTION.
  ENDCLASS.



CLASS zcl_empleado16 IMPLEMENTATION.
method constructor.
em_nombre = i_nombre.
em_dni = i_dni.
em_sal_base = i_sal_base.
endmethod.

method get_ficha.
rs_ficha =     |Nombre: { em_nombre } | &
               |Dni: { em_dni } | &
               |Salario: { calcular_salario( ) } | .


endMETHOD.

method calcular_salario.

rv_importe = em_sal_base .
endMETHOD.

ENDCLASS.

"como lo ha hecho luis

*CLASS zcl_empleado_00 DEFINITION
*  PUBLIC
*  CREATE PUBLIC .
*
*  PUBLIC SECTION.
*
*    DATA: nombre  TYPE string,
*          dni     TYPE string,
*          salario TYPE i.
*
*    METHODS:
*      constructor IMPORTING i_nombre  TYPE string
*                            i_dni     TYPE string
*                            i_salario TYPE i,
*      mostrar_ficha EXPORTING o_ficha TYPE string,
*      calcula_salario RETURNING VALUE(rv_salario) TYPE i.
*
*  PROTECTED SECTION.
*  PRIVATE SECTION.
*ENDCLASS.
*
*CLASS zcl_empleado_00 IMPLEMENTATION.
*
*  METHOD constructor.
*    me->nombre  = i_nombre.
*    me->dni     = i_dni.
*    me->salario = i_salario.
*  ENDMETHOD.
*
*  METHOD Mostrar_Ficha.
*    o_ficha = | El empleado { me->nombre } | &&
*              | con DNI { me->dni } | &&
*              | cobra { me->salario } euros |.
*  ENDMETHOD.
*
*  METHOD calcula_salario.
*    rv_salario = me->salario.
*  ENDMETHOD.
*
*ENDCLASS.
