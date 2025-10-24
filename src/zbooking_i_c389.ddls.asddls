@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBOOKING_I_C389
  as projection on ZBOOKING_R_C389
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,

      /* Associations */
      _BookingStatus,
      _BookingSupplement : redirected to composition child ZBKSPPL_I_C389,
      _Carrier,
      _Connection,
      _Customer,
      _Travel            : redirected to parent ZTRAVEL_I_C389
}
