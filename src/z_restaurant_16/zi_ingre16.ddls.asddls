@AbapCatalog.sqlViewName: 'ZV_IING'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Ingrediente'

define view ZI_INGREDIENTE
  as select from zingrediente16 as i
{
  key i.ingrediente_id,
  key i.receta_id,
      i.ingrediente_name,
      i.quantity,
      i.unit,
      i.is_allergen
}
