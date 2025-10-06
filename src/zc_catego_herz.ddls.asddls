@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS CATEGORÍAS DE LIBROS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_CATEGO_HERZ as select from ztb_catego_herz as cat
    inner join ztb_acc_cat_herz as acceso on acceso.bi_categ = cat.bi_categ 

{
    key cat.bi_categ as BiCateg,   
        cat.descripcion as Descripcion,        
        acceso.tipo_acceso as TipoAcceso
}
