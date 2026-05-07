@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZPERSONAS16'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_PERSONAS16
  as select from ZPERSONAS16
{
  key person_id as PersonID,
  first_name as FirstName,
  last_name as LastName,
  birth_date as BirthDate,
  gender as Gender,
  email as Email,
  phone as Phone,
  country as Country,
  street as Street,
  city as City,
  postal_code as PostalCode,
  is_active as IsActive,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
