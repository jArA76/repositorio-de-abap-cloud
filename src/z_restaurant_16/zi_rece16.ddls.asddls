@AbapCatalog.sqlViewName: 'ZV_IREC'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Receta'

define view ZI_RECETA
  as select from zreceta_16 as c
  association [0..*] to ZI_INGREDIENTE as _ingredientes
    on c.receta_id = _ingredientes.receta_id
{
  key c.receta_id,
      c.rest_id,
      c.receta_name,
      c.category,
      c.prep_time_min,
      c.difficulty,

      _ingredientes
}
