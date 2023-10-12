using { OrderStatusDraft } from './orderStatus-draft-service';

annotate OrderStatusDraft.StatusOrder with @(
    UI: {
        LineItem: [
            {
                $Type: 'UI.DataField',
                Value: orderStatusNumber,
                ![@UI.Importance] : #High
            },
            {
                $Type: 'UI.DataField',
                Value: orderstatusDescription,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            SortOrder : [{
                $Type : 'Common.SortOrderType',
                Property : orderStatusNumber,
            }]
        },
        SelectionFields : [
            orderStatusNumber,
            orderStatusDescription
        ]
    },
    //Object Page
    UI: {
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : '{i18n>orderStatus}',
            TypeNamePlural : '{i18n>orderStatusPlural}',
            Title : {
                $Type : 'UI.DataField',
                Value : orderStatusNumber,
            },
            Description : {
                $Type : 'UI.DataField',
                Value : orderStatusDescription,
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
                    Value: orderStatusNumber,
                    ![@Common.FieldControl] : #Mandatory
                },
                {
                    $Type : 'UI.DataField',
                    Value: orderStatusDescription,
                    ![@Common.FieldControl] : #Mandatory
                }
            ]
        },

        //Page Facets
        Facets : [
            {
                $Type : 'UI.ReferenceFacet',
                Target : '@UI.FieldGroup#GeneralData',
            }
        ]
    }
);