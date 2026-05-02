@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Reservas con agencia'

define view entity ZCDS_RESERVA
  as select from /dmo/booking as booking
    join         /dmo/travel  as travel 
            on booking.travel_id = travel.travel_id
    join         /dmo/agency  as agency 
            on travel.agency_id = agency.agency_id
{
  key booking.booking_id    as Reserva,
      booking.connection_id as Conexion,
      booking.flight_date   as FechaVuelo,
//      booking.flight_price  as Precio,
      agency.name           as Agencia
}
