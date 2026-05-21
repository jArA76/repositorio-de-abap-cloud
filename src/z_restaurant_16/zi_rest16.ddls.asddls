@AbapCatalog.sqlViewName: 'ZV_IREST'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Restaurante'

define view ZI_RESTAURANTE
  as select from zrestauran_16 as r
  association [0..*] to ZI_RECETA as _recetas
    on r.rest_id = _recetas.rest_id
{
  key r.rest_id,
      r.rest_name,
      r.city,
      r.cuisine_type,
      r.max_capacity,

      _recetas
}
