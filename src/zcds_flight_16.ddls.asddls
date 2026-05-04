@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelos con aerolínea'

define view entity ZCDS_FLIGHT_16 as select from /dmo/flight
  join /dmo/carrier on /dmo/flight.carrier_id = /dmo/carrier.carrier_id
{
  key /dmo/flight.carrier_id     as Aerolinea,
  key /dmo/flight.connection_id  as Conexion,
  key /dmo/flight.flight_date    as Fecha_de_Vuelo,
      /dmo/carrier.name          as Nombre_Aerolinea,
      /dmo/flight.price          as Precio,
      /dmo/flight.currency_code  as Moneda,
      /dmo/flight.seats_max      as Plazas_Totales,
      /dmo/flight.seats_occupied as Plazas_Ocupadas
}
