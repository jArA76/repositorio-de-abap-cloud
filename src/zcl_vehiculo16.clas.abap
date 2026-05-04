CLASS zcl_vehiculo16 DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.

   DATA:  mv_matricula   TYPE string,
          mv_marca       TYPE string,
          mv_anio_fabric TYPE i.

    METHODS:
      constructor IMPORTING i_matricula TYPE string
                            i_marca     TYPE string
                            i_anyo      TYPE i,
      arrancar,
      frenar FINAL,
      get_ficha "funcion get ficha que va a devolver un valor
        RETURNING VALUE(rs_ficha) TYPE string,
      calcular_impuesto
        RETURNING VALUE(rv_importe) TYPE decfloat16.

  PROTECTED SECTION.
    DATA: mv_velocidad_actual TYPE i.

  PRIVATE SECTION.
    DATA: mv_num_averias TYPE i.

 ENDCLASS.



CLASS zcl_vehiculo16 IMPLEMENTATION.
METHOD constructor.
    mv_matricula = i_matricula.
    mv_marca = i_marca.
    mv_anio_fabric = i_anyo.
  ENDMETHOD.

  METHOD arrancar.
    mv_velocidad_actual = 0.
  ENDMETHOD.

  METHOD frenar.
    mv_velocidad_actual = 0.
  ENDMETHOD.

  METHOD get_ficha.
    rs_ficha = |Matrícula: { mv_matricula } | &
               |Marca: { mv_marca } | &
               |Año: { mv_anio_fabric } | &
               |Velocidad: { mv_velocidad_actual } km/h|.
  ENDMETHOD.

  METHOD calcular_impuesto.
    rv_importe = 0.
  ENDMETHOD.


ENDCLASS.
