@AbapCatalog.sqlViewName: 'ZV_CING'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo Ingrediente'

define view ZC_INGREDIENTE
  as select from ZI_INGREDIENTE as i
{
  key i.ingrediente_id,
  key i.receta_id,

  @UI.lineItem: [{ position: 10 }]
  i.ingrediente_name,

  @UI.lineItem: [{ position: 20 }]
  i.quantity,

  @UI.lineItem: [{ position: 30 }]
  i.unit,

  @UI.lineItem: [{ position: 40 }]
  i.is_allergen
}
