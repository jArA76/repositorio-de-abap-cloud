@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'vista para ejercicio'
@Metadata.ignorePropagatedAnnotations: true
define view entity zvista16 as select from zejer2
{
    key comu_auto as ComuAuto,
    key provincia as Provincia,
    nom_calle as NomCalle,
    cod_postal as CodPostal,
    telefono as Telefono
}
