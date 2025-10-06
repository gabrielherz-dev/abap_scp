@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VENTAS DE LIBROS CLIENTS-LIBROS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_VENTAS_LIRBOS_HERZ as select from ztb_clnt_li_herz as VENTAS
{    
    key VENTAS.id_libro as IdLibro,
    count(distinct VENTAS.id_cliente) as num_ventas
    
} group by VENTAS.id_libro
