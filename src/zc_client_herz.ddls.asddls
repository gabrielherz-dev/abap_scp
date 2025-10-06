@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS CLIENTES'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MASTER
}
@Metadata.allowExtensions: true
define view entity ZC_CLIENT_HERZ as select from ztb_client_herz as cli
    inner join ztb_clnt_li_herz as rel_client_lib on  rel_client_lib.id_cliente = cli.id_cliente 
{
    key rel_client_lib.id_libro as IdLibro,
    key cli.id_cliente as IdCliente,
        cli.tipo_acceso as TipoAcceso,
        cli.nombre as Nombre,
        cli.apellidos as Apellidos,
        cli.email as Email,
        cli.url as Url
}
