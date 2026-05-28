@AbapCatalog.sqlViewName: 'ZMEDIASB'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: false
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'calculo de medias'
@Metadata.ignorePropagatedAnnotations: true
define view zmedias as select from /dmo/flight as flight 
{
    flight.carrier_id as CarrierId,
  //  flight.connection_id as ConnectionId,
  //  flight.flight_date as FlightDate,
   // flight.price as Price,
    //flight.currency_code as CurrencyCode,
    //flight.plane_type_id as PlaneTypeId,
    //flight.seats_max as SeatsMax,
    //flight.seats_occupied as SeatsOccupied,
    flight.currency_code,
  
    avg( flight.price as abap.dec(16,2) ) as avg_price,
    
    
    sum( flight.price ) as suma_total,
 //   min( flight.price ) as prec_min,
    max( flight.price ) as pre_max
 //   count(*) as total
    
    
    
}
group by
        flight.currency_code, flight.carrier_id    


