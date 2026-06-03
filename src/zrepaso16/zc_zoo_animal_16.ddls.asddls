@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZOO_ANIMAL_16'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_ZOO_ANIMAL_16
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_ZOO_ANIMAL_16
  association [1..1] to ZR_ZOO_ANIMAL_16 as _BaseEntity on $projection.ANIMALID = _BaseEntity.ANIMALID
{
  key AnimalID,
  Nombre,
  Especie,
  Habitat,
  PesoKg,
  FechaLlegada,
  EnPeligroExtincion,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Lastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  _BaseEntity
}
