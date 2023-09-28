using OrdersServiceDraft from './orders-draft-service';

//------------------------ Orders  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate OrdersServiceDraft.OrdersFiori with @(
	UI: {
        LineItem: [
			{
                $Type: 'UI.DataField',
                Value: orderNumber,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : orderDescription,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : orderExpirationDate,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : orderStatus,
                ![@UI.Importance] : #High
            },
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : orderNumber}]
        },
        SelectionFields: [
            orderNumber,
            orderDescription,
            orderExpirationDate,
            orderStatus
        ],
	},
    //Object Page
	UI: {
        HeaderInfo: {
            Title : {
                Value: orderNumber
            },
            TypeName: '{i18n>Order}',
            TypeNamePlural: '{i18n>OrderItems}',
            Description: {
                Value: orderDescription
            },
        },
		HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            }
        ],
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: orderNumber
                },
                {
                    $Type : 'UI.DataField',
                    Value: orderDescription
                },
                {
                    $Type : 'UI.DataField',
                    Value: orderExpirationDate
                },
                {
                    $Type : 'UI.DataField',
                    Value: orderStatus
                }
			]
        },
        FieldGroup #Admin: {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : createdBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedBy
                },
                {
                    $Type : 'UI.DataField',
                    Value : createdAt
                },
                {
                    $Type : 'UI.DataField',
                    Value : modifiedAt
                }
            ]
        },
        // Page Facets
		Facets: [
            {
                $Type: 'UI.ReferenceFacet',
                Label: '{i18n>GeneralData}',
                Target: '@UI.FieldGroup#GeneralData'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Label: '{i18n>orderItems}',
                Target: 'orderItems/@UI.LineItem'
            },
        ]
    }
);


//------------------- Invoice Items  -------------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate OrdersServiceDraft.OrderItemsFiori with @(
   	UI: {
    	TextArrangement     : #TextOnly,
        LineItem: [
			{
                $Type             : 'UI.DataField',
                Value             : product_ID,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : item,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : itemQtd,
                ![@UI.Importance] : #High
            },
		]
    },
// Object Header
    UI: {
        HeaderInfo: {
            Title: {
                $Type : 'UI.DataField',
                Value : '{i18n>orderItems}'
            },
            TypeName       : '{i18n>item}',
            TypeNamePlural : '{i18n>items}',
            Description    : {
                Value : '{i18n>orderItems}'
            }
        },
        FieldGroup #Details : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : product_ID,
                    ![@UI.Importance] : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : item,
                    ![@UI.Importance] : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : itemQtd,
                    ![@UI.Importance] : #High
                }
            ]
        },
        // Page Facets
        Facets : [
            {
                $Type  : 'UI.CollectionFacet',
                ID     : 'OrderDetails',
                Label  : '{i18n>details}',
                Facets : [
                    {
                        $Type  : 'UI.ReferenceFacet',
                        Label  : '{i18n>details}',
                        Target : '@UI.FieldGroup#Details'
                    }
                ]
            }
        ]
    }
);