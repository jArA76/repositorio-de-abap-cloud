CLASS zcl_empleado16 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA:   em_nombre   TYPE string,
          em_dni       TYPE string,
          em_sal_base TYPE i.
          "  em_anyoempresa type i value 8.
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
