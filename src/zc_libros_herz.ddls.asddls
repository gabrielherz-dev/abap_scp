@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS LIBROS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED    
}
@Metadata.allowExtensions: true
define view entity ZC_LIBROS_HERZ as select from ztb_libros_herz as lib
    inner join ZC_CATEGO_HERZ as cat on lib.bi_categ = cat.BiCateg
    left outer join ZC_VENTAS_LIRBOS_HERZ as VENt on lib.id_libro = VENt.IdLibro
    association [0..*] to ZC_CLIENT_HERZ as _cli on $projection.IdLibro =  _cli.IdLibro 
    {
    key lib.id_libro as IdLibro,
        lib.bi_categ as Categoria,
        lib.titulo as Titulo,
        lib.autor as Autor,
        lib.editorial as Editorial,
        lib.idioma as Idioma,
        lib.paginas as Paginas,
        @Semantics.amount.currencyCode: 'Moneda'
        lib.precio as Precio,
        lib.moneda as Moneda,
        lib.formato as Formato,
        lib.url as Imagen,        
        cat.Descripcion as Descripcion,
        cat.TipoAcceso as TipoAcceso,
        case
            when VENt.num_ventas <= 0 then 0
            when VENt.num_ventas between 1 and 2 then 1
            when VENt.num_ventas > 2 and VENt.num_ventas <= 3 then 2
            when VENt.num_ventas >= 4 then 3
            else 0
        end as ventas,
        '' as Estado,
        
        _cli        
}
