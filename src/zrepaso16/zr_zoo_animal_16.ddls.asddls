@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZOO_ANIMAL_16'
@EndUserText.label: 'Animales del Zoo'
define root view entity ZR_ZOO_ANIMAL_16
  as select from zzoo_animal_16
{
  key animal_id as AnimalID,
  nombre as Nombre,
  especie as Especie,
  habitat as Habitat,
  peso_kg as PesoKg,
  fecha_llegada as FechaLlegada,

  en_peligro_extincion as EnPeligroExtincion,
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
