@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Interface entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSPPL_I_C389 as projection on ZBKSPPL_R_C389
{
    key BookSupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      /* Associations */
      _Booking : redirected to parent ZBOOKING_I_C389,
      _Product,
      _SupplementText,
      _Travel : redirected to ZTRAVEL_I_C389
}
