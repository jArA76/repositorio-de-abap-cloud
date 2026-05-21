@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'definition para bebidas'
@Metadata.ignorePropagatedAnnotations: true
define root view entity z_i_bebidas
  as select from zbebi16
{
  key codigo                as Codigo,
      nombre                as Nombre,
      tipo                  as Tipo,
      origen                as Origen,
      graduacion            as Graduacion,
      precio                as Precio,


      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,

      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,

      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt
}
