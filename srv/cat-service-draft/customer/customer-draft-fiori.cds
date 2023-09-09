using CustomerServiceDraft from './customer-draft-service';

//---------------------- Customer  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate CustomerServiceDraft.CustomerFiori with @(UI: {
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
                Value : customerActive,
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
                Target: 'adress/@UI.Identification'
            },
        ]
    }
);

annotate CustomerServiceDraft.AddressFiori with @(UI: {
    Identification : [
        {
            $Type : 'UI.DataField',
            Value : zipCode,
            ![@UI.Importance] : #High
        },        
        {
            $Type : 'UI.DataField',
            Value : street,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : number,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : neighborhood,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : city,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : state,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : country,
            ![@UI.Importance] : #High
        },
    ],   
});
