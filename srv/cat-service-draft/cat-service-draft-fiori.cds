using CatalogServiceDraft from './cat-service-draft';

//----------------------- Products  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CatalogServiceDraft.ProductsFiori with @(UI: {
        LineItem: [
			{   
                $Type: 'UI.DataField', 
                Value: productName,
                ![@UI.Importance] : #High
            },
			{   
                $Type: 'UI.DataField', 
                Value: productName,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : productDescription,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : brand,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : EAN,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : productName}]
        },
        SelectionFields: [ 
            productName,
            productDescription,
            brand,
            EAN
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                Value: productName
            },
            TypeName: '{i18n>Product}',
            TypeNamePlural: '{i18n>Products}',
            ImageUrl : image,
            ///TypeImageUrl : 'image/png',
            Description: { 
                Value: EAN 
            }, 
        },
		HeaderFacets            : [
        /*    {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Image',
                ![@UI.Importance] : #Medium
            },
        */
        ],
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: productDescription
                },
                {
                    $Type : 'UI.DataField',
                    Value: brand
                },
                {
                    $Type : 'UI.DataField',
                    Value: EAN
                },
                {
                    $Type : 'UI.DataField',
                    Value: obs
                }               
			]                        
        },

        // Page Facets
		Facets: [

            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
        ]    
    }
);

//---------------------- Customer  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CatalogServiceDraft.CustomerFiori with @(UI: {
        LineItem: [

			{   
                $Type: 'UI.DataField', 
                Value: customerName,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : customerAddress,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : customerAddress,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : customerHouseNum,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : customerState,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : customerName}]
        },
        SelectionFields: [ 
            customerName,
            customerState
        ],
	},
//Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                Value: customerName
            },
            TypeName: '{i18n>Customer}',
            TypeNamePlural: '{i18n>Customer}',
            ///TypeImageUrl : 'image/png',
            // Description: { 
            //    Value: customerState 
            //}, 
        },
		HeaderFacets            : [
        /*    {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Image',
                ![@UI.Importance] : #Medium
            },
        */
        ],
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: customerName
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerAddress
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerHouseNum
                } ,
                {
                    $Type : 'UI.DataField',
                    Value: customerState
                }                   
			]                        
        },

        // Page Facets
		Facets: [

            {    
                $Type: 'UI.ReferenceFacet', 
                Label: '{i18n>GeneralData}', 
                Target: '@UI.FieldGroup#GeneralData'
            }
        ]    
    }
);


//------------------------ Orders  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CatalogServiceDraft.OrdersFiori with @(
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
                Value : customer.customerName,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : customer.customerState,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : orderNumber}]
        },
        SelectionFields: [ 
            orderNumber,
            orderDescription,
            customer_ID
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
                    Value: customer_ID
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
annotate CatalogServiceDraft.OrderItemsFiori with @( 
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
                Value : '{i18n>OrderItems}'
            },    
            TypeName       : '{i18n>Item}',
            TypeNamePlural : '{i18n>Items}',
            Description    : {
                Value : '{i18n>OrderItems}'
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
                Label  : '{i18n>Details}',
                Facets : [
                    {
                        $Type  : 'UI.ReferenceFacet',
                        Label  : '{i18n>Details}',
                        Target : '@UI.FieldGroup#Details'
                    }
                ]
            }
        ]
    }  
);
