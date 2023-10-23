sap.ui.define([
	"./BaseController",
    "../model/formatter",
    "../model/proposal",
    "sap/ui/model/Filter",
    "sap/ui/model/FilterOperator",
    "sap/ui/core/Fragment",
    "sap/m/MessageBox"
], function(
	BaseController,
    Formatter,
    Proposal,
    Filter,
    FilterOperator,
    Fragment,
    MessageBox
) {
	"use strict";

	return BaseController.extend("finalproject.app.proposal.controller.Proposal", {

        formatter: Formatter,

        /* =========================================================== */
        /* lifecycle methods                                           */
        /* =========================================================== */
        onInit: function () {
            this.getRouter().getRoute("proposal").attachPatternMatched(this._onObjectMatched.bind(this), this);
        },

        /* =========================================================== */
        /* event handlers                                              */
        /* =========================================================== */
        onLiveChangeAmount: function(oEvent) {
            let oValue = String(this._clearFormatting(oEvent.getParameter("value")));

            if(oEvent.getParameter("value") != ""){
                this._formateValue(oValue, oEvent.getParameter("id"));
            }else {
                this.byId(oEvent.getParameter("id")).setValue("");
            }
        },

        onPressCustomer: async function(oEvent) {
            if(!this._oCustomerFragment){
                this._oCustomerFragment = Fragment.load({
                    id: this.getView().getId(),
                    name: "finalproject.app.proposal.view.fragments.Customers",
                    controller: this
                });

                this._oCustomerFragment = await this._oCustomerFragment.then(
                    function (oDialog) {
                        this.getView().addDependent(oDialog);
                        return oDialog;
                    }.bind(this)
                );
            }
            this._oCustomerFragment.open();
        },

        onCustomerSearch: function(oEvent) {
            let oValue  = oEvent.getParameter("value"),
                oFilter = [
                    new Filter("CNPJ", FilterOperator.Contains, oValue),
                    new Filter("customerName", FilterOperator.Contains, oValue),
                    new Filter("customerSurname", FilterOperator.Contains, oValue),
                    new Filter("customerEmail", FilterOperator.Contains, oValue)
                ];

            oEvent.getSource().getBinding("items").filter(oFilter);
        },

        onCustomerConfirm: function(oEvent) {
            let oSelectedItems = oEvent.getParameter("selectedItems");

            if(oSelectedItems.length != 0) {
                let oModel = this.getModel("proposal").getData();

                oSelectedItems.map(sItem => {
                    let oObject = sItem.getBindingContext().getObject();

                    let oItemExist = oModel.proposal.proposalCustomers.find(sItem => {
                        if(sItem.ID === oObject.ID) return sItem;
                    })

                    if(oItemExist === undefined) {
                        oModel.proposal.proposalCustomers.push(oObject);
                    }
                });

                this.getModel("proposal").refresh(true);
            }
        },

        onCustomerClose: function(oEvent) {
            this._oCustomerFragment.close();
        },

        onPressDeleteCustomer: function(oEvent) {
            let oID = oEvent.getSource().getDependents()[0].getProperty("text"),
                oModel = this.getModel("proposal").getData(),
                oItems = [];

            oModel.proposal.proposalCustomers.map(sItem => {
                if(sItem.ID != oID) {
                    oItems.push(sItem);
                }
            });

            oModel.proposal.proposalCustomers = oItems;
            this.getModel("proposal").refresh(true);
        },

        onPressSave: function(oEvent) {
            let oModel = this.getModel("proposal").getData();

            if(oModel.proposal.proposalNumber           != ""   && 
               oModel.proposal.proposalTitle            != ""   &&
               oModel.proposal.proposalExpirationDate   != null && 
               oModel.proposal.proposalCustomers.length != 0      )
            {
                let oItems = oModel.proposal.proposalItems.filter(sItem => {
                    if(sItem.proposalItemValue === "") return sItem;
                });

                if(oItems.length === 0) {
                    this.setAppBusy(true);

                    let oObject = {
                        "proposalNumber": oModel.proposal.proposalNumber,
                        "proposalTitle": oModel.proposal.proposalTitle,
                        "proposalExpirationDate": Formatter.converterDate(oModel.proposal.proposalExpirationDate),
                        "proposalStatusNumber": "1",
                        "customer_ID": oModel.proposal.proposalCustomers[0].ID,
                        "order_ID": oModel.orderId
                      }
                    
                    this.getModel().create("/Proposal", oObject, {
                        success: async function(oData) {

                            let oKey = this.getModel().createKey("/Proposal", {
                                ID: oData.ID
                            });

                            oKey += "/proposalItems"

                            let oPromiseItems = [];

                            oModel.proposal.proposalItems.map(sItem => {
                                let oItem = sItem;
                                oItem.proposalItemValue = oItem.proposalItemValue.replaceAll(".", "").replace(",", ".");

                                oPromiseItems.push(
                                    new Promise(
                                        function(resolve, reject) {
                                            this.getModel().create(oKey, oItem, {
                                                success: function(oData) {
                                                    resolve(oData);
                                                }.bind(this),
                                                error: function(oError) {
                                                    reject(oError);
                                                }.bind(this)
                                            });
                                        }.bind(this)
                                    )
                                )
                            });

                            await Promise.all(oPromiseItems).then(
                                function(oData) {
                                    MessageBox.success(this.getResourceBundle().getText("messageSuccessProposal"), {
                                        actions: [MessageBox.Action.CLOSE],
                                        emphasizedAction: MessageBox.Action.CLOSE,
                                        onClose: function (sAction) {
                                            this.getRouter().navTo("main");
                                            this.setAppBusy(false);
                                        }.bind(this)
                                    });
                                }.bind(this)
                            ).catch(
                                function(oError) {
                                    MessageBox.error(this.getResourceBundle().getText("messageErrorProposal"));
                                    this.setAppBusy(false);
                                }.bind(this)
                            )

                        }.bind(this),
                        error: function(oError) {
                            MessageBox.error(this.getResourceBundle().getText("messageErrorProposal"));
                            this.setAppBusy(false);
                        }.bind(this)
                    })

                }else {
                    MessageBox.error(this.getResourceBundle().getText("messageErrorFieldMandatory"));
                }

            }else {
                MessageBox.error(this.getResourceBundle().getText("messageErrorFieldMandatory"));
            }
        },
        
        /* =========================================================== */
        /* internal methods                                            */
        /* =========================================================== */
        _onObjectMatched: async function(oEvent) {
            this.setAppBusy(true);

            let oOrderId    = oEvent.getParameter("arguments").orderId,
                oProposalId = oEvent.getParameter("arguments").proposalId;

            if(oProposalId === "0") {
                let oKey = this.getModel().createKey("/Orders", {
                    ID: oOrderId
                });

                this.getModel().read(oKey, {
                    urlParameters: {
                        "$expand": "orderItems"
                    },
                    success: function(oData) {
                        let oObjectProposal = Proposal.initSelectionModel();

                        oObjectProposal.orderId = oOrderId;
                        oObjectProposal.proposal.proposalTitle = this.getResourceBundle().getText("proposalViewLabelNew");

                        oData.orderItems.results.map(sItem => {
                            oObjectProposal.proposal.proposalItems.push(this._createObjectItem(sItem));
                        });

                        this.getModel("proposal").setData(oObjectProposal);
                        this.getModel("proposal").refresh(true);

                        this.setAppBusy(false);
                    }.bind(this),
                    error: function(oError) {

                        this.setAppBusy(false);
                    }.bind(this)
                });
            }else {

            }
        },

        _createObjectItem: function(sObject) {
            return {
                proposalItemNumber: sObject.item,
                proposalItemQtd: sObject.itemQtd,
                proposalItemValue: "",
            };
        }
	});
});