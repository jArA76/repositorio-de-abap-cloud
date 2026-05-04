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
