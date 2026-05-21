@AbapCatalog.sqlViewName: 'ZV_CREC'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo Receta'

define view ZC_RECETA
  as select from ZI_RECETA as c
{
  key c.receta_id,

  c.rest_id,

  @UI.lineItem: [{ position: 10 }]
  c.receta_name,

  @UI.lineItem: [{ position: 20 }]
  c.category,

  @UI.lineItem: [{ position: 30 }]
  c.prep_time_min,

  @UI.lineItem: [{ position: 40 }]
  c.difficulty,

  c._ingredientes
}
