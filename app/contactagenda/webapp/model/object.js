sap.ui.define([], function() {
	"use strict";

	return {
		initSelectionModel: function() {
			return {
				ID: "",
				createdAt: null,
				createdBy: "",
				modifiedAt: null,
				modifiedBy: "",
                customer: {
                    CNPJ: "",
					customerName : "",
					customerSurname: "",
					company: "",
					customerEmail: "",
					telephone: "",
					customerSource: "",
					customerType: "3",
					customerInactive: false,
					zipCode: "",
					street : "",
					number: "",
					neighborhood: "",
					city: "",
					state: "",
					country: "",
                },
				customerStatus: {},
                common: {
					visibleEditButton: false,
                    visibleEdit: false,
                    visibleSave: true,
                    visibleDelete: false,
                    visiblePublish: false,
					visibleCancel: false
                },
				State: {
					CNPJ: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					customerName: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					customerSurname: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					company: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					customerEmail: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					telephone: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					customerSource: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					customerType: {
						Enabled: false,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					customerInactive: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					zipCode: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					street: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					number: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					neighborhood: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					city: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					state: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					country: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					}
				}
			}
		}
	};
});