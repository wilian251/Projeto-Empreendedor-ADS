using ProposalServiceDraft from './proposal-draft-service';

//------------------------ proposals  ---------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate ProposalServiceDraft.ProposalFiori with @(
	UI: {
        LineItem: [
			{
                $Type: 'UI.DataField',
                Value: proposalNumber,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : proposalTitle,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : proposalExpirationDate,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : proposalStatusNumber,
                ![@UI.Importance] : #High
            },
		],
        PresentationVariant : {
            $Type     : 'UI.PresentationVariantType',
            Sortproposal : [{Property : proposalNumber}]
        },
        SelectionFields: [
            proposalNumber,
            proposalTitle,
            proposalExpirationDate,
            proposalStatusNumber
        ],
	},
    //Object Page
	UI: {
        HeaderInfo: {
            Title : {
                Value: proposalNumber
            },
            TypeName: '{i18n>proposal}',
            TypeNamePlural: '{i18n>proposalItems}',
            Description: {
                Value: proposalTitle
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
                    Value: proposalNumber
                },
                {
                    $Type : 'UI.DataField',
                    Value: proposalTitle
                },
                {
                    $Type : 'UI.DataField',
                    Value: proposalExpirationDate
                },
                {
                    $Type : 'UI.DataField',
                    Value: proposalStatusNumber
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
                Label: '{i18n>generalData}',
                Target: '@UI.FieldGroup#GeneralData'
            },
            {
                $Type: 'UI.ReferenceFacet',
                Label: '{i18n>proposalItems}',
                Target: 'proposalItems/@UI.LineItem'
            },
        ]
    }
);


//------------------- Invoice Items  -------------------//
//------------------------------------------------------//
//------------------------------------------------------//
annotate ProposalServiceDraft.ProposalItemsFiori with @(
   	UI: {
    	TextArrangement     : #TextOnly,
        LineItem: [
			{
                $Type             : 'UI.DataField',
                Value             : proposalItemNumber,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : proposalItemQtd,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : proposalItemValue,
                ![@UI.Importance] : #High
            },
		]
    },
// Object Header
    UI: {
        HeaderInfo: {
            Title: {
                $Type : 'UI.DataField',
                Value : '{i18n>proposalItems}'
            },
            TypeName       : '{i18n>item}',
            TypeNamePlural : '{i18n>items}',
            Description    : {
                Value : '{i18n>proposalItems}'
            }
        },
        FieldGroup #Details : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value : proposalItemNumber,
                    ![@UI.Importance] : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : proposalItemQtd,
                    ![@UI.Importance] : #High
                },
                {
                    $Type : 'UI.DataField',
                    Value : proposalItemValue,
                    ![@UI.Importance] : #High
                }
            ]
        },
        // Page Facets
        Facets : [
            {
                $Type  : 'UI.CollectionFacet',
                ID     : 'ProposalDetails',
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