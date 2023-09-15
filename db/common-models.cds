
context common_models {
  //----------------------- Address ----------------------//
  //------------------------------------------------------//
  //------------------------------------------------------//
  //Aspect
  aspect Address {
    zipCode: String not null       @title: '{i18n>zipCode}'      @description : '{i18n>zipCode}';
    street : String  not null      @title: '{i18n>street}'       @description : '{i18n>street}';
    number: Integer  not null      @title: '{i18n>number}'       @description : '{i18n>number}';
    neighborhood: String  not null @title: '{i18n>neighborhood}' @description : '{i18n>neighborhood}';
    city: String  not null         @title: '{i18n>city}'         @description : '{i18n>city}';
    state: String  not null        @title: '{i18n>state}'        @description : '{i18n>state}';
    country: String  not null      @title: '{i18n>country}'      @description : '{i18n>country}';
  }
}

annotate common_models.Address with @(
  title              : '{i18n>address}',
  description        : '{i18n>address}',
);
