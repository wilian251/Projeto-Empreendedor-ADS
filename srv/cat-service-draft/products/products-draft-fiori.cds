using ProductsServiceDraft from './products-draft-service';

//----------------------- Products  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate ProductsServiceDraft.ProductsFiori with @(UI: {
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