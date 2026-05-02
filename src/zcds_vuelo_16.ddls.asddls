@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'vuelos con aerolineas'

define view entity ZCDS_vuelo_16 as select from /dmo/flight as vuelos
  join /dmo/carrier as aerolineas on vuelos.carrier_id = aerolineas.carrier_id
{
  key aerolineas.name as nombre,
  vuelos.connection_id as conexion,
  vuelos.flight_date as fecha,
  vuelos.currency_code as moneda,
  vuelos.price as precio
  
}
