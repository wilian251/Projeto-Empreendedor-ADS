sap.ui.define([
	"./BaseController",
    "../model/formatter",
    "../model/object",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/core/Fragment",
    "sap/m/MessageBox",
    "sap/m/MessageToast"
], function(
	BaseController,
	Formatter,
	ObjectCustomer,
	Filter,
	FilterOperator,
	Fragment,
	MessageBox,
	MessageToast
) {
	"use strict";

	return BaseController.extend("finalproject.app.objectts.controller.Proposal", {

        formatter: Formatter,

        /* =========================================================== */
        /* lifecycle methods                                           */
        /* =========================================================== */
        onInit: function () {
            this.getRouter().getRoute("object").attachPatternMatched(this._onObjectMatched.bind(this), this);
        },

        /* =========================================================== */
        /* event handlers                                              */
        /* =========================================================== */

        onLiveChangeCNPJ: function(oEvent) {
            let oValue = String(this._clearFormatting(oEvent.getParameter("value")));

            if(oEvent.getParameter("value") != ""){

                let oValueFormatted = Formatter.cnpj(oValue);

                this.byId(oEvent.getParameter("id")).setValue(oValueFormatted);
            }else {
                this.byId(oEvent.getParameter("id")).setValue("");
            }
        },

        onLiveChangeCEP: function(oEvent) {
            let oValue = String(this._clearFormatting(oEvent.getParameter("value")));

            if(oEvent.getParameter("value") != ""){

                let oValueFormatted = Formatter.cep(oValue);

                this.byId(oEvent.getParameter("id")).setValue(oValueFormatted);
            }else {
                this.byId(oEvent.getParameter("id")).setValue("");
            }
        },

        onLiveChangeTelephone: function(oEvent) {
            let oValue = String(this._clearFormatting(oEvent.getParameter("value")));

            if(oEvent.getParameter("value") != ""){

                let oValueFormatted = Formatter.telephone(oValue);

                this.byId(oEvent.getParameter("id")).setValue(oValueFormatted);
            }else {
                this.byId(oEvent.getParameter("id")).setValue("");
            }
        },

        onDeleteCustomer: function(oEvent) {
            this.setAppBusy(true);

            let oModel = this.getModel("object").getData();

            let oKey = this.getModel().createKey("/Customer", {
                ID: oModel.ID
            });

            this.getModel().remove(oKey, {
                success: function(oData) {
                    this.setAppBusy(false);
                    MessageToast.show(this.getResourceBundle().getText("messageSuccessDeleteCustomer"));
                    
                    this.getRouter().navTo("main");

                }.bind(this),
                error: function(oError) {
                    this.setAppBusy(false);
                    MessageBox.error(this.getResourceBundle().getText("messageErrorDeleteCustomer"));
                }.bind(this)
            });

        },

        onCancelCustomer: function(oEvent) {
            let oModel = this.getModel("object").getData();

            oModel.common.visibleDelete     = true;
            oModel.common.visibleEditButton = true;
            oModel.common.visibleEdit       = false;
            oModel.common.visibleSave       = false;
            oModel.common.visibleCancel     = false;
            
            this.getModel("object").refresh(true);
        },

        onEditCustomer: function(oEvent) {
            let oModel = this.getModel("object").getData();

            oModel.common.visibleDelete     = false;
            oModel.common.visibleEditButton = false;
            oModel.common.visibleEdit       = true;
            oModel.common.visibleSave       = true;
            oModel.common.visibleCancel     = true;
            
            this.getModel("object").refresh(true);
        },

        onSaveCustomer: function(oEvent) {
            let oModel = this.getModel("object").getData();
            
            let bValid = this._validationFields();
            
            if(bValid) {
                this.setAppBusy(true);
                if(oModel.ID === this.getResourceBundle().getText("ObjectViewLabelNew")){

                    this.getModel().create("/Customer", oModel.customer, {
                        success: function(oData) {
                            oModel.common.visibleEdit       = false;
                            oModel.common.visibleEditButton = true;
                            oModel.common.visibleDelete     = true;
                            oModel.common.visibleSave       = false;
                            oModel.common.visibleCancel     = false;

                            oModel.ID         = oData.ID;
                            oModel.createdAt  = oData.createdAt;
                            oModel.createdBy  = oData.createdBy;
                            oModel.modifiedAt = oData.modifiedAt;
                            oModel.modifiedBy = oData.modifiedBy;

                            this.getModel("object").refresh(true);

                            this.setAppBusy(false);

                            MessageToast.show(this.getResourceBundle().getText("messageSuccessCreateCustomer"));

                        }.bind(this),
                        error: function(oError) {
                            this.setAppBusy(false);
                            MessageBox.error(this.getResourceBundle().getText("messageErrorCreateCustomer"))
                        }.bind(this)
                    });
                }else {
                    this._UpdateCustomer();
                }
            }

        },
        
        /* =========================================================== */
        /* internal methods                                            */
        /* =========================================================== */
        _onObjectMatched: async function(oEvent) {
            this.setAppBusy(true);

            let oObjecId = oEvent.getParameter("arguments").objectId;

            if(oObjecId != this.getResourceBundle().getText("ObjectViewLabelNew")) {
                let oKey = this.getModel().createKey("/Customer", {
                    ID: oObjecId
                });

                this.getModel().read(oKey, {
                    success: function(oData) {
                        let oObjectCustomer = ObjectCustomer.initSelectionModel();

                        oObjectCustomer.common.visibleEdit       = false;
                        oObjectCustomer.common.visibleEditButton = true;
                        oObjectCustomer.common.visibleDelete     = true;
                        oObjectCustomer.common.visibleSave       = false;
                        oObjectCustomer.common.visibleCancel     = false;

                        oObjectCustomer.ID         = oObjecId;
                        oObjectCustomer.createdAt  = oData.createdAt;
                        oObjectCustomer.createdBy  = oData.createdBy;
                        oObjectCustomer.modifiedAt = oData.modifiedAt;
                        oObjectCustomer.modifiedBy = oData.modifiedBy;

                        oObjectCustomer.customer.CNPJ             = oData.CNPJ;
                        oObjectCustomer.customer.customerName     = oData.customerName;
                        oObjectCustomer.customer.customerSurname  = oData.customerSurname;
                        oObjectCustomer.customer.company          = oData.company;
                        oObjectCustomer.customer.customerEmail    = oData.customerEmail;
                        oObjectCustomer.customer.telephone        = oData.telephone;
                        oObjectCustomer.customer.customerSource   = oData.customerSource;
                        oObjectCustomer.customer.customerType     = oData.customerType;
                        oObjectCustomer.customer.customerInactive = oData.customerInactive;
                        oObjectCustomer.customer.zipCode          = oData.zipCode;
                        oObjectCustomer.customer.street           = oData.street;
                        oObjectCustomer.customer.number           = oData.number;
                        oObjectCustomer.customer.neighborhood     = oData.neighborhood;
                        oObjectCustomer.customer.city             = oData.city;
                        oObjectCustomer.customer.state            = oData.state;
                        oObjectCustomer.customer.country          = oData.country;
                        this.getModel("object").setData(oObjectCustomer);
                        this.getModel("object").refresh(true);

                        this.setAppBusy(false);
                    }.bind(this),
                    error: function(oError) {
                        this.setAppBusy(false);
                    }.bind(this)
                });
            }else {
                let oModel = ObjectCustomer.initSelectionModel();

                oModel.common.visibleDelete     = false;
                oModel.common.visibleEditButton = false;
                oModel.common.visibleEdit       = true;
                oModel.common.visibleSave       = true;
                oModel.common.visibleCancel     = true;

                oModel.ID = oObjecId;

                this.getModel("object").setData(oModel);
                this.getModel("object").refresh(true);

                this.setAppBusy(false);
            }
        },

        _UpdateCustomer: function() {
            this.setAppBusy(true);

            let oModel = this.getModel("object").getData();

            let oKey = this.getModel().createKey("/Customer", {
                ID: oModel.ID
            });

            this.getModel().update(oKey, oModel.customer, {
                success: function(oData) {
                    this.setAppBusy(false);
                    
                    oModel.common.visibleEdit       = false;
                    oModel.common.visibleEditButton = true;
                    oModel.common.visibleDelete     = true;
                    oModel.common.visibleSave       = false;
                    oModel.common.visibleCancel     = false;
                    
                    this.getModel("object").refresh(true);

                    MessageToast.show(this.getResourceBundle().getText("messageSuccessUpdateCustomer"));
                    
                }.bind(this),
                error: function(oError) {
                    this.setAppBusy(false);
                    MessageBox.error(this.getResourceBundle().getText("messageErrorUpdateCustomer"));
                }.bind(this)
            });

        },

        _validationFields: function() {
            let oModel      = this.getModel("object").getData(),
                oFieldClass = ["CNPJ", "customerName","customerSurname","company",
                               "customerEmail", "telephone", "customerSource", "customerType",
                               "customerInactive", "zipCode", "street", "number", "neighborhood",
                               "city", "state", "country"],
                bValid      = true;

            oFieldClass.forEach(sField => {
                if(oModel.customer[sField] === null || oModel.customer[sField] === "") {
                    oModel.State[sField].ValueStateText = this.getResourceBundle().getText("messageErrorFieldMandatory");
                    oModel.State[sField].ValueState     = sap.ui.core.ValueState.Error;

                    bValid = false;
                }else {
                    oModel.State[sField].ValueStateText = "";
                    oModel.State[sField].ValueState     = sap.ui.core.ValueState.None;
                }
            });

            this.getModel("object").refresh(true);

            return bValid;

        },
	});
});