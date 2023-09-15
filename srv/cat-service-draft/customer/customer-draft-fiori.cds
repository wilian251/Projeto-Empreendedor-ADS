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
                Value : customerInactive,
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
                    Value: CNPJ,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: company,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerName,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerSurname,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerEmail,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: telephone,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerSource,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerType,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerInactive
                }
			]
        },
        FieldGroup #Address: {
            $Type : 'UI.FieldGroupType',
			Data: [
                {
                    $Type : 'UI.DataField',
                    Value: zipCode,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: street,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: number,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: neighborhood,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: city,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: state,
                    ![@Common.FieldControl] : #Mandatory,
                },
                {
                    $Type : 'UI.DataField',
                    Value: country,
                    ![@Common.FieldControl] : #Mandatory,
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
                Target: '@UI.FieldGroup#Address'
            },
        ]
    }
);
