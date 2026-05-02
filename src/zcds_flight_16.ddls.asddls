@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelos con aerolínea'

define view entity ZCDS_FLIGHT_16 as select from /dmo/flight
  join /dmo/carrier on /dmo/flight.carrier_id = /dmo/carrier.carrier_id
{
  key /dmo/flight.carrier_id     as Aerolinea,
  key /dmo/flight.connection_id  as Conexion,
  key /dmo/flight.flight_date    as FechaVuelo,
      /dmo/carrier.name          as NombreAerolinea,
      /dmo/flight.price          as Precio,
      /dmo/flight.currency_code  as Moneda,
      /dmo/flight.seats_max      as PlazasTotales,
      /dmo/flight.seats_occupied as PlazasOcupadas
}
