@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista consumo RAP bebidas'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo.typeName: 'Bebida'
@UI.headerInfo.typeNamePlural: 'Bebidas'
@UI.createHidden: false
@UI.updateHidden: false
@UI.deleteHidden: false
define root view entity ZC_BEBIDAS_16
provider contract transactional_query 
  as projection on ZI_BEBIDAS_16
  
{
  //@UI.selectionField: [{ position: 10 }]
  @UI.lineItem: [{ position: 10, label: 'Codigo' }]
  key Codigo,

  @UI.selectionField: [{ position: 20 }]
  @UI.lineItem: [{ position: 20, label: 'Nombre' }]
  Nombre, 
  
  @UI.selectionField: [{ position: 30 }]
  @UI.lineItem: [{ position: 30, label: 'Tipo' }]
      Tipo,
  
  @UI.selectionField: [{ position: 40 }]
  @UI.lineItem: [{ position: 40, label: 'Origen' }]
      Origen,

  @UI.lineItem: [{ position: 50, label: 'Graduacion' }]
      Graduacion,
      
  @UI.lineItem: [{ position: 60, label: 'Precio' }]
      Precio    
}
