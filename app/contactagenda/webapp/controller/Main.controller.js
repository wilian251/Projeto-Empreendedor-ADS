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

    return BaseController.extend("finalproject.app.contactagenda.controller.Main", {

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

        onPressCustomer: function(oEvent) {
            let oObject = oEvent.getSource().getBindingContext().getObject();

            this.getRouter().navTo("object", {
                objectId: oObject.ID
            });
        },

        onAddCustomer: function(oEvent) {
            this.getRouter().navTo("object", {
                objectId: this.getResourceBundle().getText("ObjectViewLabelNew")
            });
        },

        onBeforeRebindTable: function(oEvent) {
            let oFilters = oEvent.getParameter("bindingParams").filters;

            oFilters.push(new Filter("customerType", FilterOperator.EQ, "3"));

            oEvent.getParameter("bindingParams").parameters["$expand"] = "customerStatus";
        },

        /* =========================================================== */
        /* internal methods                                            */
        /* =========================================================== */
        _onObjectMatched: async function(oEvent) {}

    });

});