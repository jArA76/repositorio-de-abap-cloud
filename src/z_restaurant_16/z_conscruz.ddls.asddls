@AbapCatalog.sqlViewName: 'ZV_REST_REC'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Restaurantes con recetas'

define view ZCDS_REST_REC
  as select from zrestauran_16 as r
    inner join zreceta_16 as c
      //on  r.client  = c.client
      on r.rest_id = c.rest_id
      inner join zingrediente16 as ingre
       on c.receta_id = ingre.receta_id
{
 // key r.client,
  key r.rest_id,
  key c.receta_id,
  key ingre.ingrediente_id,

      r.rest_name,
      r.city,
      r.cuisine_type,
      r.max_capacity,

      c.receta_name,
      c.category,
      c.prep_time_min,
      c.difficulty,
      
      ingre.ingrediente_name,
      ingre.quantity,
      ingre.unit,
      ingre.is_allergen
}
