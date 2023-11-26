sap.ui.define([], function() {
	"use strict";

	return {
		initSelectionModel: function() {
			return {
				orderId: "",
                proposal: {
                    proposalNumber: "",
                    proposalTitle: "",
					proposalExpirationDateShort: "",
                    proposalExpirationDate: null,
                    proposalStatusNumber: "",
                    createdAt: null,
                    createdBy: "",
                    modifiedAt: null,
                    modifiedBy: "",
                    proposalCustomers: [],
                    proposalItems: [],
                },
                common: {
                    visibleEdit: false,
                    visibleSave: true,
                    visibleDelete: false,
                    visiblePublish: false,
                    editable: true
                },
				State: {
					proposalNumber: {
						Enabled: false,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					proposalTitle: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					proposalExpirationDate: {
						Enabled: false,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					},
					proposalStatusNumber: {
						Enabled: true,
						ValueState: sap.ui.core.ValueState.None,
						ValueStateText: ""
					}
				}
			}
		}
	};
});