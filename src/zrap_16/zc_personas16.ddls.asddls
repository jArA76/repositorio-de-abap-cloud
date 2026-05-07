@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZPERSONAS16'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_PERSONAS16
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_PERSONAS16
  association [1..1] to ZR_PERSONAS16 as _BaseEntity on $projection.PERSONID = _BaseEntity.PERSONID
{
  key PersonID,
  FirstName,
  LastName,
  BirthDate,
  Gender,
  Email,
  Phone,
  Country,
  Street,
  City,
  PostalCode,
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
