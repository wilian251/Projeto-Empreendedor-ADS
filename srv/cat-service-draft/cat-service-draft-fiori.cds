using CatalogServiceDraft from './cat-service-draft';

//----------------------- Users ------------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CatalogServiceDraft.UsersFiori with @(UI: {
        LineItem: [
            {   
                $Type: 'UI.DataField', 
                Value: userEmail,
                ![@UI.Importance] : #High
            },
			{   
                $Type: 'UI.DataField', 
                Value: userName,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : userSurname,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : userActive,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : userEmail}]
        },
        SelectionFields: [ 
            userEmail,
            userName,
            userActive
        ],
	},
    //Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                Value: userEmail
            },
            TypeName: '{i18n>users}',
            TypeNamePlural: '{i18n>users}',
            Description: { 
                Value: userName 
            }, 
        },
		HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            },
        ],
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
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: userEmail
                },
                {
                    $Type : 'UI.DataField',
                    Value: userName
                },
                {
                    $Type : 'UI.DataField',
                    Value: userSurname
                },
                {
                    $Type : 'UI.DataField',
                    Value: userActive
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

//----------------------- Products  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CatalogServiceDraft.ProductsFiori with @(UI: {
        LineItem: [
            {   
                $Type: 'UI.DataField', 
                Value: code,
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
                Value : productValue,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : productActive,
                ![@UI.Importance] : #High
            }
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : code}]
        },
        SelectionFields: [ 
            code,
            productName,
            productDescription,
            productActive
        ],
	},
    //Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                Value: code
            },
            TypeName: '{i18n>Product}',
            TypeNamePlural: '{i18n>Products}',
            Description: { 
                Value: productName 
            }, 
        },
		HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            },
        ],
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
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: productName
                },
                {
                    $Type : 'UI.DataField',
                    Value: productDescription
                },
                {
                    $Type : 'UI.DataField',
                    Value: productValue
                },
                {
                    $Type : 'UI.DataField',
                    Value: productActive
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
                Value: CNPJ,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : company,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : customerName,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : customerSurname,
                ![@UI.Importance] : #High
            },
            {   
                $Type : 'UI.DataField', 
                Value : customerSituation,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            SortOrder : [{Property : CPNJ}]
        },
        SelectionFields: [ 
            CNPJ,
            customerName,
            customerEmail,
            customerSituation,
            customerType
        ],
    },
    //Object Page
	UI: {
        HeaderInfo: {          
            Title : { 
                Value: CNPJ
            },
            TypeName: '{i18n>CNPJ}',
            TypeNamePlural: '{i18n>CNPJ}',
             Description: { 
                Value: customerName 
            }, 
        },
		HeaderFacets            : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Admin',
                ![@UI.Importance] : #Medium
            },
        ],
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
        FieldGroup #GeneralData: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: company
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerName
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerSurname
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerEmail
                },
                {
                    $Type : 'UI.DataField',
                    Value: telephone
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerSituation
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerSource
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerType
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerActive
                }
			]                        
        },
        FieldGroup #Adress : {
            $Type : 'UI.FieldGroupType',
            Data : [
                {
                    $Type: 'UI.DataField',
                    Value: adress.street
                },
                {
                    $Type: 'UI.DataField',
                    Value: adress.number
                },
                {
                    $Type: 'UI.DataField',
                    Value: adress.zipCode
                },
                {
                    $Type: 'UI.DataField',
                    Value: adress.neighborhood
                },
                {
                    $Type: 'UI.DataField',
                    Value: adress.city
                },
                {
                    $Type: 'UI.DataField',
                    Value: adress.state
                },
                {
                    $Type: 'UI.DataField',
                    Value: adress.country
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
                Label: '{i18n>address}', 
                Target: 'address/@UI.Identification'
            },
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
