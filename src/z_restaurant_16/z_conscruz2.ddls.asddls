@AbapCatalog.sqlViewName: 'ZV_REST_REC2'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Restaurantes con recetas'

@UI.headerInfo: {
  typeName: 'Registro',
  typeNamePlural: 'Registros',
  title: { value: 'rest_name' }
}

define view ZCDS_REST_REC2
  as select from zrestauran_16 as r
    inner join zreceta_16 as c
      on r.rest_id = c.rest_id
    inner join zingrediente16 as ingre
      on c.receta_id = ingre.receta_id
{
  key r.rest_id,
  key c.receta_id,
  key ingre.ingrediente_id,

  // 🟦 RESTAURANTE
  @UI.lineItem: [{ position: 10 }]
  @UI.selectionField: [{ position: 10 }]
  r.rest_name,

  @UI.lineItem: [{ position: 20 }]
  @UI.selectionField: [{ position: 20 }]
  r.city,

  @UI.lineItem: [{ position: 30 }]
  r.cuisine_type,

  @UI.lineItem: [{ position: 40 }]
  r.max_capacity,

  // 🟩 RECETA
  @UI.lineItem: [{ position: 50 }]
  @UI.selectionField: [{ position: 30 }]
  c.receta_name,

  @UI.lineItem: [{ position: 60 }]
  c.category,

  @UI.lineItem: [{ position: 70 }]
  c.prep_time_min,

  @UI.lineItem: [{ position: 80 }]
  c.difficulty,

  // 🟧 INGREDIENTE
  @UI.lineItem: [{ position: 90 }]
  ingre.ingrediente_name,

  @UI.lineItem: [{ position: 100 }]
  ingre.quantity,

  @UI.lineItem: [{ position: 110 }]
  ingre.unit,

  @UI.lineItem: [{ position: 120 }]
  ingre.is_allergen
}
