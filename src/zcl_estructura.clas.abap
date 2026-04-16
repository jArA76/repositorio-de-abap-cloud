CLASS zcl_estructura DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
     INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_estructura IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    data lv_var1 type i.
*"forma1
*    types: begin OF ty_cliente,
*           nombre type string,
*           edad type i,
*           correo type string,
*           telefono type string,
*           end OF ty_CLIENTE.
*
*
*           data ls_cliente type ty_cliente.
*
*           ls_cliente-nombre = 'juan'.
*           ls_cliente-edad = 88.
*           ls_cliente-correo = 'elcorreo'.
*           ls_cliente-telefono = 123232.
*
*           "out->write( ls_cliente ).
*"forma2
*
*         data(ls_var2) = value ty_cliente( nombre = 'yoplay' edad = 49 ).
*
*
*        "out->write( ls_var2 ).
*"forma3
*
*data: BEGIN OF ls_empleado2,
*      nombre type string value 'pepe',
*      edad type i,
*      "correo type /dmo/email_address,
*    end OF ls_EMPLEADO2.
*
*    "out->write( ls_empleado2 ).

"estructura anidada

    data: begin of ls_empleado,

          begin of info,
            id type i value 1234,
            nombre type string value 'jonas',

          end of info,

           begin of direccion,
            calle type string value 'posadas',
            numero type i value 13,

          end of direccion,

          begin of posicion,
            dpto type string value 'IT',
            salario type i value 232,

          end of posicion,

          end of ls_empleado.

out->write( ls_empleado ).



  ENDMETHOD.

ENDCLASS.
