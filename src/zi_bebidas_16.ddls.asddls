@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista base RAP Bebidas'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_BEBIDAS_16
//provider contract transactional_query
as select from zbebidas_16
{
key codigo as Codigo,
nombre as Nombre,
tipo as Tipo,
origen as Origen,
graduacion as Graduacion,
precio as Precio,
last_changed_at as LastChangedAt
}
