using { CustomerStatusDraft } from './customerStatus-draft-service';

annotate CustomerStatusDraft.StatusCustomerFiori with @(
    UI: {
        LineItem: [
            {
                $Type: 'UI.DataField',
                Value: customerStatusNumber,
                ![@UI.Importance] : #High
            },
            {
                $Type: 'UI.DataField',
                Value: customerStatusDescription,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            SortOrder : [{
                $Type : 'Common.SortOrderType',
                Property : customerStatusNumber,
            }]
        },
        SelectionFields : [
            customerStatusNumber,
            customerStatusDescription
        ]
    },
    //Object Page
    UI: {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>customerStatus}',
            TypeNamePlural : '{i18n>customerStatusPlural}',
            Title : {
                $Type : 'UI.DataField',
                Value : customerStatusNumber,
            },
            Description : {
                $Type : 'UI.DataField',
                Value : customerStatusDescription,
            },
        },
        HeaderFacets : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.Identification',
            },
        ],
        FieldGroup #Admin : {
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
        FieldGroup #GeneralData : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Value: customerStatusNumber,
                    ![@Common.FieldControl] : #Mandatory
                },
                {
                    $Type : 'UI.DataField',
                    Value: customerStatusDescription,
                    ![@Common.FieldControl] : #Mandatory
                }
            ]
        },

        //Page Facets
        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Label : '{i18n>generalData}',
                Target : '@UI.FieldGroup#GeneralData',
            }
        ]
    }
);
