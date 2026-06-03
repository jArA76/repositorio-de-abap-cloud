CLASS zcl_con_dia14_5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CON_DIA14_5 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*  data(dia_act) = cl_abap_context_info=>get_system_date( ).
*
*  select  from /dmo/flight fields
*    carrier_id,connection_id,flight_date, seats_max,
*    seats_occupied, seats_max - seats_occupied as asientos_libres,
*    dats_days_between( @dia_act,flight_date ) as dias_restantes
*    where flight_date >= @dia_act
*    into table @DATA(lt_prueba).
*     out->write( lt_prueba ).

    DATA lv_hoy TYPE d.
    lv_hoy = '19760630'.
    SELECT SINGLE FROM /dmo/carrier
            FIELDS
               " is_valid( @lv_hoy ) AS valido,

               " weekday( @lv_hoy ) AS dia_semana,

                case weekday( @lv_hoy )
                    WHEN 0 THEN 'Lunes'
                    WHEN 1 THEN 'Martes'
                    WHEN 2 THEN 'Miércoles'
                    WHEN 3 THEN 'Jueves'
                    WHEN 4 THEN 'Viernes'
                    WHEN 5 THEN 'Sábado'
                    WHEN 6 THEN 'Domingo'
                end AS dia_semana,

                case is_valid( @lv_hoy )
                    WHEN 1 THEN 'Válido'
                    WHEN 0 THEN 'No Válido'
                end AS validacion_de_fecha
           " WHERE carrier_id = 'AA'


            INTO @DATA(ls_carrier).
    IF sy-subrc = 0.
      out->write( ls_carrier ).
    ENDIF.



    enDMETHOD.
ENDCLASS.
