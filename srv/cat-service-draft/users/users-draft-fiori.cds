using UsersServiceDraft from './users-draft-service';

//----------------------- Users ------------------------//
//------------------------------------------------------//
//------------------------------------------------------//
//List Page
annotate UsersServiceDraft.UsersFiori with @(UI: {
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