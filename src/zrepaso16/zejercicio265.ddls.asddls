@AbapCatalog.sqlViewName: 'ZCDEPASO23B'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS de Repaso'
@Metadata.ignorePropagatedAnnotations: true
define view ZCDEPASO23 as 
    select from /dmo/flight as flight
    inner join /dmo/carrier as carrier
      on flight.carrier_id = carrier.carrier_id
{
   flight.carrier_id,
   flight.connection_id,
   flight.flight_date,
      flight.price,
      flight.currency_code,
      carrier.name as nombre,
      
     division( flight.price * 80, 100, 2 ) as dcto 

}
