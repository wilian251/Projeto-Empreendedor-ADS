using {
  cuid,
  managed,
  sap,
  temporal,
  Currency,
  User
} from '@sap/cds/Common';


namespace finalproject;

//----------------------- Usuários ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Users : cuid, managed {
  userEmail : String;
  userName : String;
  userSurname : String;
  userActive : Boolean;
}


@cds.odata.valuelist
//Annotation
annotate Users with @(
  title              : '{i18n>users}',
  description        : '{i18n>users}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [userEmail],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : userEmail
  }]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : userEmail,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  userEmail            @(
    title       : '{i18n>email}',
    description : '{i18n>email}',
    Common      : {
        FieldControl             : #Mandatory,
        Text : {
          $value                 : userName,
          ![@UI.TextArrangement] : #TextLast
      }
    }
  );
  userName @(
    title       : '{i18n>name}',
    description : '{i18n>name}',
    Common      : {
      FieldControl : #Mandatory,
      TextFor      : userEmail
    }
  );
  userSurname @(
    title       : '{i18n>surname}',
    description : '{i18n>surname}',
  );
  userActive @(
    title       : '{i18n>active}',
    description : '{i18n>active}',
  );
};

//----------------------- Address ----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Address : cuid , managed {
  zipCode: String;
  street : String;
  number: Integer;
  neighborhood: String;
  city: String;
  state: String;
  country: String;
}

@cds.odata.valuelist
//Annotation
annotate Address with @(
  title              : '{i18n>address}',
  description        : '{i18n>address}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [zipCode],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : zipCode
  }]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : zipCode,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  zipCode @(
    title       : '{i18n>zipCode}',
    description : '{i18n>zipCode}',
    Common      : {
        FieldControl             : #Mandatory
    }
  );
  street @(
    title       : '{i18n>street}',
    description : '{i18n>street}',
    Common      : {
      FieldControl : #Mandatory
    }
  );
  number @(
    title       : '{i18n>number}',
    description : '{i18n>number}',
  );
  neighborhood @(
    title       : '{i18n>neighborhood}',
    description : '{i18n>neighborhood}',
  );
  city @(
    title       : '{i18n>city}',
    description : '{i18n>city}',
  );
  state @(
    title       : '{i18n>state}',
    description : '{i18n>state}',
  );
  country @(
    title       : '{i18n>country}',
    description : '{i18n>country}',
  );
};

//----------------------- CUSTOMERS  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Customer : cuid , managed {
  customerName : String;
  customerSurname: String;
  company: String;
  customerEmail: String;
  telephone: String;
  CNPJ: Integer;
  customerSource: String;
  customerType: String;
  customerActive: Boolean;
  adress: Association to one Address;
}


@cds.odata.valuelist
//Annotation
annotate Customer with @(
  title              : '{i18n>customer}',
  description        : '{i18n>customer}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [CNPJ],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : CNPJ
  }]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : CNPJ,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  CNPJ @(
    title       : '{i18n>CNPJ}',
    description : '{i18n>CNPJ}',
    Common      : {
        FieldControl             : #Mandatory
    }
  );
  customerName @(
    title       : '{i18n>customerName}',
    description : '{i18n>customerName}',
    Common      : {
        FieldControl             : #Mandatory
    }
  );
  customerSurname @(
    title       : '{i18n>customerSurname}',
    description : '{i18n>customerSurname}',
    Common      : {
      FieldControl : #Mandatory
    }
  );
  company @(
    title       : '{i18n>company}',
    description : '{i18n>company}',
  );
  customerEmail @(
    title       : '{i18n>email}',
    description : '{i18n>email}',
  );
  telephone @(
    title       : '{i18n>telephone}',
    description : '{i18n>telephone}',
  );
  customerSource @(
    title       : '{i18n>customerSource}',
    description : '{i18n>customerSource}',
  );
  customerActive @(
    title       : '{i18n>active}',
    description : '{i18n>active}',
  );
  adress @(
    title       : '{i18n>adress}',
    description : '{i18n>adress}',
  );
};

//--------------------- Products -----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Products : cuid , managed {
  code: Integer;
  productName: String;
  productDescription: String;
  productValue: Decimal;
  productActive: Boolean;
}

@cds.odata.valuelist
//Annotation
annotate Products with @(
  title              : '{i18n>products}',
  description        : '{i18n>products}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [code],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : code
  }]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : code,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  code @(
    title       : '{i18n>code}',
    description : '{i18n>code}',
    Common      : {
        FieldControl             : #Mandatory
    }
  );
  productName @(
    title       : '{i18n>productName}',
    description : '{i18n>productName}',
    Common      : {
      FieldControl : #Mandatory
    }
  );
  productDescription @(
    title       : '{i18n>productDescription}',
    description : '{i18n>productDescription}',
  );
  productValue @(
    title       : '{i18n>productValue}',
    description : '{i18n>productValue}',
  );
  productActive @(
    title       : '{i18n>active}',
    description : '{i18n>active}',
  );
};

//---------------------- Orders ------------------------//
//------------------------------------------------------//
//------------------------------------------------------//

entity Orders : cuid, managed {
  orderNumber: Integer;
  orderDescription : String;
  orderExpirationDate: Date;
  orderStatus: Integer;
  orderItems: Composition of many OrderItems on orderItems.order = $self;
}

@cds.odata.valuelist
//Annotation
annotate Orders with @(
  title              : '{i18n>orders}',
  description        : '{i18n>orders}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [orderNumber],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : orderNumber
  }]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : orderNumber,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  orderNumber @(
    title       : '{i18n>orderNumber}',
    description : '{i18n>orderNumber}',
    Common      : {
        FieldControl             : #Mandatory
    }
  );
  orderDescription @(
    title       : '{i18n>orderDescription}',
    description : '{i18n>orderDescription}',
    Common      : {
      FieldControl : #Mandatory
    }
  );
  orderExpirationDate @(
    title       : '{i18n>orderExpirationDate}',
    description : '{i18n>orderExpirationDate}',
    Common      : {
      FieldControl : #Mandatory
    }
  );
  orderStatus @(
    title       : '{i18n>orderStatus}',
    description : '{i18n>orderStatus}',
  );
  orderItems @(
    title       : '{i18n>orderItems}',
    description : '{i18n>orderItems}',
  );
};

//--------------------- OrderItems --------------------//
//------------------------------------------------------//
//------------------------------------------------------//

entity OrderItems : cuid, managed {
  item: Integer;
  itemQtd: Integer;
  order: Association to Orders;
  product: Association to Products;
}

@cds.odata.valuelist
//Annotation
annotate OrderItems with @(
  title              : '{i18n>orderItems}',
  description        : '{i18n>orderItems}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [order.orderNumber, product.productName],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : order.orderNumber
  },
  {
    $Type : 'UI.DataField',
    Value : product.productName
  },
  ]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : order.orderNumber,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  order @(
    title       : '{i18n>order}',
    description : '{i18n>order}',
    Common      : {
        FieldControl             : #Mandatory,
        Text      : {
                $value                 : order.orderNumber,
                ![@UI.TextArrangement] : #TextOnly
            },
          ValueList                : {
              CollectionPath : 'Orders',
              SearchSupported: true,
              Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'order_ID',
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'orderNumber',

                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'orderDescription'
                }
              ]
          }
    }
  );
  product @(
    title       : '{i18n>product}',
    description : '{i18n>product}',
    Common      : {
      FieldControl : #Mandatory,
      Text      : {
        $value                 : product.productName,
        ![@UI.TextArrangement] : #TextOnly
      },
      ValueList                : {
        CollectionPath : 'Products',
        SearchSupported: true,
        Parameters     : [
          {
              $Type             : 'Common.ValueListParameterInOut',
              LocalDataProperty : 'product_ID',
              ValueListProperty : 'ID'
          },
          {
              $Type             : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty : 'productName',

          },
          {
              $Type             : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty : 'productDescription'
          }
        ]
      }
    } 
  );
  item @(
    title       : '{i18n>item}',
    description : '{i18n>item}',
    Common : {
      FieldControl : #Mandatory,
    }
  );
  itemQtd @(
    title       : '{i18n>itemQtd}',
    description : '{i18n>itemQtd}',
  );
};

//--------------------- Proposal -----------------------//
//------------------------------------------------------//
//------------------------------------------------------//

entity Proposal : cuid, managed {
  proposalNumber: Integer;
  proposalTitle: String;
  proposalExpirationDate: Date;
  proposalStatus: Integer;
  customer: Association to one Customer;
  ///order: Association to Orders;
}

@cds.odata.valuelist
//Annotation
annotate Proposal with @(
  title              : '{i18n>proposal}',
  description        : '{i18n>proposal}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [proposalNumber],
  UI.Identification  : [
    {
      $Type: 'UI.DataField',
      Value: proposalNumber
    },
    {
      $Type: 'UI.DataField',
      Value: proposalTitle
    }
  ]
) {
  ID @(
    Core.Computed,
    Common.Text: {
      $value                 : proposalNumber,
      ![@UI.TextArrangement] : #TextOnly
    }
  );
  proposalNumber @(
    title       : '{i18n>proposalNumber}',
    description : '{i18n>proposalNumber}',
    Common : { FieldControl : #Mandatory, },
  );
  proposalTitle @(
    title       : '{i18n>proposalNumber}',
    description : '{i18n>proposalNumber}',
    Common : { FieldControl : #Mandatory, },
  );
  proposalExpirationDate @(
    title       : '{i18n>proposalExpirationDate}',
    description : '{i18n>proposalExpirationDate}',
    Common : { FieldControl : #Mandatory, },
  );
  proposalStatus @(
    title       : '{i18n>proposalStatus}',
    description : '{i18n>proposalStatus}'
  );
  customer @(
    title       : '{i18n>cutomer}',
    description : '{i18n>cutomer}',
    Common      : {
      FieldControl : #Mandatory,
      Text : {
        $value                 : customer.CNPJ,
        ![@UI.TextArrangement] : #TextOnly
      },
      ValueList : {
          $Type : 'Common.ValueListType',
          CollectionPath : 'Customer',
          SearchSupported : true,
          Parameters      : [
            {
              $Type             : 'Common.ValueListParameterInOut',
              LocalDataProperty : 'customer_ID',
              ValueListProperty : 'ID'
            },
            {
              $Type             : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty : 'customerName'
            },
            {
              $Type             : 'Common.ValueListParameterDisplayOnly',
              ValueListProperty : 'customerSurname'
            }
          ]
      },
    }
  );
  order @(
    title       : '{i18n>order}',
    description : '{i18n>order}',
    Common      : {
      FieldControl : #Mandatory,
      Text      : {
          $value                 : order.orderNumber,
          ![@UI.TextArrangement] : #TextOnly
      },
      ValueList                : {
          CollectionPath : 'Orders',
          SearchSupported: true,
          Parameters     : [
            {
                $Type             : 'Common.ValueListParameterInOut',
                LocalDataProperty : 'order_ID',
                ValueListProperty : 'ID'
            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'orderNumber',

            },
            {
                $Type             : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'orderDescription'
            }
          ]
      }
    }
  );
};