using {
  cuid,
  managed,
  sap,
  temporal,
  Currency,
  User
} from '@sap/cds/Common';

using { common_models.Address as Address } from './common-models';

namespace finalproject;

//----------------------- Usuários ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Users : cuid, managed {
  userEmail : String not null @mandatory;
  userName : String not null;
  userSurname : String not null;
  userInactive : Boolean;
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
  userInactive @(
    title       : '{i18n>inactive}',
    description : '{i18n>inactive}',
  );
};

//----------------------- CUSTOMERS  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Customer : cuid , managed, Address {
  CNPJ: String  not null @mandatory;
  customerName : String not null @mandatory;
  customerSurname: String not null;
  company: String  not null;
  customerEmail: String  not null;
  telephone: String  not null;
  customerSource: String not null;
  customerType: String not null;
  customerInactive: Boolean;
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
  customerType @(
    title       : '{i18n>customerType}',
    description : '{i18n>customerType}',
  );
  customerInactive @(
    title       : '{i18n>inactive}',
    description : '{i18n>inactive}',
  );
};

//--------------------- Products -----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Products : cuid , managed {
  productCode: String not null @mandatory;
  productName: String not null;
  productDescription: String not null;
  productValue: Decimal not null;
  productInactive: Boolean not null default true;
}

@cds.odata.valuelist
//Annotation
annotate Products with @(
  title              : '{i18n>products}',
  description        : '{i18n>products}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [productCode],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : productCode
  }]
) {
  ID @(
        Core.Computed,
        Common.Text : {
            $value                 : productCode,
            ![@UI.TextArrangement] : #TextOnly
        }
  );
  productCode @(
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
  productInactive @(
    title       : '{i18n>inactive}',
    description : '{i18n>inactive}',
  );
};

//---------------------- Orders ------------------------//
//------------------------------------------------------//
//------------------------------------------------------//

entity Orders : cuid, managed {
  orderNumber: String not null @mandatory;
  orderDescription : String not null;
  orderExpirationDate: Date not null;
  orderStatus: String not null;
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
  item: String not null @mandatory;
  itemQtd: String not null;
  productCode: String not null;
  order: Association to Orders @readonly;
  product: Association to Products on product.productCode = productCode @readonly;
}

@cds.odata.valuelist
//Annotation
annotate OrderItems with @(
  title              : '{i18n>orderItems}',
  description        : '{i18n>orderItems}',
  UI.TextArrangement : #TextOnly,
  Common.SemanticKey : [order.orderNumber],
  UI.Identification  : [{
    $Type : 'UI.DataField',
    Value : order.orderNumber
  }]
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
  productCode @(
    title       : '{i18n>product}',
    description : '{i18n>product}',
    Common      : {
      FieldControl : #Mandatory,
      Text      : {
        $value                 : productCode,
        ![@UI.TextArrangement] : #TextOnly
      },
      ValueList                : {
        CollectionPath : 'Products',
        SearchSupported: true,
        Parameters     : [
          {
            $Type             : 'Common.ValueListParameterInOut',
            LocalDataProperty : 'productCode',
            ValueListProperty : 'productCode'
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
  proposalNumber: String not null @mandatory;
  proposalTitle: String not null;
  proposalExpirationDate: Date not null;
  proposalStatus: String not null;
  customer: Composition of many Customer;
  order: Composition of one Orders;
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