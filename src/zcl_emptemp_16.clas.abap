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



CLASS ZCL_EMPTEMP_16 IMPLEMENTATION.


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
