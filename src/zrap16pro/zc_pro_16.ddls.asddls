@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZPRO_16'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_PRO_16
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_PRO_16
  association [1..1] to ZR_PRO_16 as _BaseEntity on $projection.ID = _BaseEntity.ID
{
  key ID,
  Nombre,
  Profesion,
  Salario,
  IsActive,
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
