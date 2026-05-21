@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'comportamiento'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity z_c_bebidas 
provider contract transactional_query
as projection on z_i_bebidas
{
    key Codigo,
    Nombre,
    Tipo,
    Origen,
    Graduacion,
    Precio,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}
