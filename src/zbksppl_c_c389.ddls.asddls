@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Comsumption entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'BookingSupplementID' ]

define view entity ZBKSPPL_C_C389
  as projection on zbksppl_r_c389
{
  key BookSupplUUID,
      TravelUUID,
      BookingUUID,

      @Search.defaultSearchElement: true
      BookingSupplementID,

      @Search.defaultSearchElement: true
      @ObjectModel.text.element: [ 'SupplementDescription' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Supplement_StdVH',
                                                    element: 'SupplementID'},
                                           additionalBinding: [{ localElement: 'Price',
                                                                 element: 'Price',
                                                                 usage: #RESULT },

                                                                 { localElement: 'CurrencyCode',
                                                                 element: 'CurrencyCode',
                                                                 usage: #RESULT }],

                                          useForValidation: true }]
      SupplementID,
      _SupplementText.Description as SupplementDescription : localized,


      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH',
                                                    element: 'Currency' },
                                          useForValidation: true }]
      CurrencyCode,

      LocalLastChangedAt,

      /* Associations */
      _Booking : redirected to parent ZBOOKING_c_C389,
      _Product,
      _SupplementText,
      _Travel  : redirected to ZTRAVEL_C_C389
}
