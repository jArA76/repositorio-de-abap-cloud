@AbapCatalog.sqlViewName: 'ZCDSFLIGHTREPORT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZCDS_FLIGHT_REPORT_16'
@Metadata.ignorePropagatedAnnotations: true

define view ZCDS_FLIGHT_REPORT_16 as //hay que relacionar todas las tablas, la primera con la segunda, la segunda con la tercera, la tercera con la primera.
select from /dmo/flight as flight
    inner join /dmo/carrier as carrier
    on flight.carrier_id = carrier.carrier_id
    inner join /dmo/connection as conexiones
    on carrier.carrier_id = conexiones.carrier_id
    and flight.connection_id  = conexiones.connection_id
    
{
   key carrier.carrier_id as ident,
   key flight.connection_id as cone,
   key flight.flight_date as fechvu,
    carrier.name as aerolinea,  
   // @Semantics.amount.currencyCode: 'moneda'
    flight.price as precio,
    @Semantics.currencyCode: true
    flight.currency_code as moneda,
    conexiones.airport_from_id as asal,
    conexiones.airport_to_id as alleg,
    conexiones.departure_time as horsalida,
    conexiones.arrival_time as horllegada,
    conexiones.distance,
  //  @Semantics.amount.currencyCode: 'moneda'
    division( flight.price * 80, 100, 2 ) as dcto, 
    
   // flight.seats_occupied,
    flight.seats_max - flight.seats_occupied as asi_dispo,  
    @Semantics.amount.currencyCode: 'moneda'
    flight.price - division( flight.price * 80, 100, 2 ) as imp_dcto,
    
    concat( conexiones.airport_from_id, concat( ' -> ', conexiones.airport_to_id ) )     as ruta
    
}  group by carrier.name, flight.flight_date, flight.connection_id, flight.price, flight.currency_code, flight.seats_occupied,conexiones.airport_from_id,
conexiones.airport_to_id,conexiones.departure_time,conexiones.arrival_time, conexiones.distance,flight.seats_max,carrier.carrier_id
