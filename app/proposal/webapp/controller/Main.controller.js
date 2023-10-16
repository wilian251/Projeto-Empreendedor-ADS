sap.ui.define([
    "./BaseController",
    "../model/formatter",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator"
], function (
    BaseController,
    Formatter,
	Filter,
	FilterOperator
) {
    "use strict";

    return BaseController.extend("finalproject.app.proposal.controller.Main", {

        formatter: Formatter,

        /* =========================================================== */
        /* lifecycle methods                                           */
        /* =========================================================== */
        onInit: function () {
            this.getRouter().getRoute("main").attachPatternMatched(this._onObjectMatched.bind(this), this);
        },

        /* =========================================================== */
        /* event handlers                                              */
        /* =========================================================== */
        onBeforeRebindTable: function(oEvent) {
            let oFilters = oEvent.getParameter("bindingParams").filters;

            oFilters.push(new Filter("orderExpirationDate", FilterOperator.GE, Formatter.initDateHours()));
            oFilters.push(new Filter("orderStatusNumber", FilterOperator.EQ, "2"));
        },

        onPressOrder: function(oEvent) {
            let oObject = oEvent.getSource().getBindingContext().getObject();

            this.getRouter().navTo("proposal", {
                orderId: oObject.ID,
                proposalId: "0"
            });
        },

        /* =========================================================== */
        /* internal methods                                            */
        /* =========================================================== */
        _onObjectMatched: async function(oEvent) {}

    });

});