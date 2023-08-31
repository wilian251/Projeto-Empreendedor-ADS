using {
  cuid,
  managed,
  sap,
  temporal,
  Currency,
  User
} from '@sap/cds/Common';


namespace finalproject;

//----------------------- Usuário  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
entity Users : cuid, managed {
  userEmail : String;
  userName : String;
  userSurname : String;
  active : Boolean;
}


@cds.odata.valuelist
//Annotation
annotate Users with @(
  title              : '{i18n>Users}',
  description        : '{i18n>Users}',
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
      TextFor      : email
    }
  );
  userSurname @(
    title       : '{i18n>surname}',
    description : '{i18n>surname}',
  );
  active @(
    title       : '{i18n>active}',
    description : '{i18n>active}',
  );
};


//----------------------- CUSTOMERS  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
// entity Customer : cuid , managed {
//     customerName : String;
//     customerAddress : String;
//     customerState: String;
//     customerHouseNum: LargeString;
// }


// @cds.odata.valuelist
// //Annotation
// annotate Customer with @(
//   title              : '{i18n>Customer}',
//   description        : '{i18n>Customer}',
//   UI.TextArrangement : #TextOnly,
//   Common.SemanticKey : [customerName],
//   UI.Identification  : [{
//     $Type : 'UI.DataField',
//     Value : customerName
//   }]
// ) {
//   ID @(
//         Core.Computed,
//         Common.Text : {
//             $value                 : customerName,
//             ![@UI.TextArrangement] : #TextOnly
//         }
//   );
//   customerName @(
//     title       : '{i18n>customerName}',
//     description : '{i18n>customerName}',
//     Common      : {
//         FieldControl             : #Mandatory
//     }
//   );
//   customerAddress @(
//     title       : '{i18n>customerAddress}',
//     description : '{i18n>customerAddress}',
//     Common      : {
//       FieldControl : #Mandatory
//     }
//   );
//   customerState @(
//     title       : '{i18n>customerState}',
//     description : '{i18n>customerState}',
//   );
//   customerHouseNum @(
//     title       : '{i18n>customerHouseNum}',
//     description : '{i18n>customerHouseNum}',
//   );
// };



//----------------------- Address ----------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
// entity Address : cuid , managed {
//       zipCode: String;
//       orderDescription : String;
//       customer: Association to one Customer;
//       orderItems: Composition of many OrderItems on orderItems.order = $self;
// }

// @cds.odata.valuelist
// //Annotation
// annotate Orders with @(
//   title              : '{i18n>Orders}',
//   description        : '{i18n>Orders}',
//   UI.TextArrangement : #TextOnly,
//   Common.SemanticKey : [orderNumber],
//   UI.Identification  : [{
//     $Type : 'UI.DataField',
//     Value : orderNumber
//   }]
// ) {
//   ID @(
//         Core.Computed,
//         Common.Text : {
//             $value                 : orderNumber,
//             ![@UI.TextArrangement] : #TextOnly
//         }
//   );
//   orderNumber @(
//     title       : '{i18n>orderNumber}',
//     description : '{i18n>orderNumber}',
//     Common      : {
//         FieldControl             : #Mandatory
//     }
//   );
//   orderDescription @(
//     title       : '{i18n>orderDescription}',
//     description : '{i18n>orderDescription}',
//     Common      : {
//       FieldControl : #Mandatory
//     }
//   );
//   customer @(
//     title       : '{i18n>customer}',
//     description : '{i18n>customer}',
//   );
//   orderItems @(
//     title       : '{i18n>orderItems}',
//     description : '{i18n>orderItems}',
//   );
// };

//--------------------- ORDERS ITEMS -------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//Entity
// entity OrderItems : cuid , managed {
//       order: Association to Orders;
//       product: Association to Products;
//       itemQtd: Integer;
// }


// @cds.odata.valuelist
// //Annotation
// annotate OrderItems with @(
//   title              : '{i18n>OrderItems}',
//   description        : '{i18n>OrderItems}',
//   UI.TextArrangement : #TextOnly,
//   Common.SemanticKey : [order.orderNumber, product.productName],
//   UI.Identification  : [{
//     $Type : 'UI.DataField',
//     Value : order.orderNumber
//   },
//   {
//     $Type : 'UI.DataField',
//     Value : product.productName
//   },
//   ]
// ) {
//   ID @(
//         Core.Computed,
//         Common.Text : {
//             $value                 : order.orderNumber,
//             ![@UI.TextArrangement] : #TextOnly
//         }
//   );
//   order @(
//     title       : '{i18n>order}',
//     description : '{i18n>order}',
//     Common      : {
//         FieldControl             : #Mandatory,
//         Text      : {
//                 $value                 : order.orderNumber,
//                 ![@UI.TextArrangement] : #TextOnly
//             },
//           ValueList                : {
//               CollectionPath : 'Orders',
//               SearchSupported: true,
//               Parameters     : [
//                 {
//                     $Type             : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : 'order_ID',
//                     ValueListProperty : 'ID'
//                 },
//                 {
//                     $Type             : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty : 'orderNumber',

//                 },
//                 {
//                     $Type             : 'Common.ValueListParameterDisplayOnly',
//                     ValueListProperty : 'orderDescription'
//                 }
//               ]
//           }
//     }
//   );
//   product @(
//     title       : '{i18n>product}',
//     description : '{i18n>product}',
//     Common      : {
//       FieldControl : #Mandatory,
//       Text      : {
//         $value                 : product.productName,
//         ![@UI.TextArrangement] : #TextOnly
//       },
//       ValueList                : {
//         CollectionPath : '',
//         SearchSupported: true,
//         Parameters     : [
//           {
//               $Type             : 'Common.ValueListParameterInOut',
//               LocalDataProperty : 'product_ID',
//               ValueListProperty : 'ID'
//           },
//           {
//               $Type             : 'Common.ValueListParameterDisplayOnly',
//               ValueListProperty : 'productName',

//           },
//           {
//               $Type             : 'Common.ValueListParameterDisplayOnly',
//               ValueListProperty : 'productDescription'
//           }
//         ]
//       }
//     } 
//   );
//   itemQtd @(
//     title       : '{i18n>itemQtd}',
//     description : '{i18n>itemQtd}',
//   );
// };
