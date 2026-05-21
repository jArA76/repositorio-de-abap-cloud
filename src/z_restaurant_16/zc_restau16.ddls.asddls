@AbapCatalog.sqlViewName: 'ZV_CREST'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumo Restaurante'

@UI.headerInfo: {
  typeName: 'Restaurante',
  typeNamePlural: 'Restaurantes',
  title: { value: 'rest_name' }
}



define view ZC_RESTAURANTE
  as select from ZI_RESTAURANTE as r
{
  key r.rest_id,

  @UI.lineItem: [{ position: 10 }]
  @UI.identification: [{ position: 10 }]
  r.rest_name,

  @UI.lineItem: [{ position: 20 }]
  r.city,

  @UI.lineItem: [{ position: 30 }]
  r.cuisine_type,

  @UI.lineItem: [{ position: 40 }]
  r.max_capacity,

  // navegación
  r._recetas
}
