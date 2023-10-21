const cds = require('@sap/cds');

async function StatusOrderNumerator(req, tx) {

    const oValueInit = "1";
            
    let oStatusOrder = await tx.read(cds.services.CatalogService.entities.StatusOrder, ['max(orderStatusNumber)']);

    let oNewValue = oValueInit;

    if(oStatusOrder.length != 0) {
        let oValueString = oStatusOrder[0]['MAX(ORDERSTATUSNUMBER)'];
        
        if(oValueString != null) {
            oNewValue = Number(oValueString) + 1;
        }
    }

    req.data.orderStatusNumber = String(oNewValue);
};

async function StatusCustomerNumerator(req, tx) {

    const oValueInit = "1";

    let oStatusCustomer = await tx.read(cds.services.CatalogService.entities.StatusCustomer, ['max(customerStatusNumber)']);

    let oNewValue = oValueInit;

    if(oStatusCustomer.length != 0) {
        let oValueString = oStatusCustomer[0]['MAX(CUSTOMERSTATUSNUMBER)'];
        
        if(oValueString != null) {
            oNewValue = Number(oValueString) + 1;
        }
    }

    req.data.customerStatusNumber = String(oNewValue);
};

async function ProductNumerator(req, tx) {

    const oValueInit = "4000000000";

    let oProduct = await tx.read(cds.services.CatalogService.entities.Products, ['max(productCode)']);

    let oNewValue = oValueInit;

    if(oProduct.length != 0) {
        let oValueString = oProduct[0]['MAX(PRODUCTCODE)'];

        if(oValueString != null) {            
            oNewValue = Number(oValueString) + 1;
        }       
    }    

    req.data.productCode = String(oNewValue);
};

async function OrdersNumerator(req, tx) {

    const oValueInit = "7000000000";
   
    let oOrder = await tx.read(cds.services.CatalogService.entities.Orders, ['max(orderNumber)']); 
    
    let oNewValue = oValueInit;

    if(oOrder.length != 0) {
        let oValueString = oOrder[0]['MAX(ORDERNUMBER)'];
        
        if(oValueString != null) {
            oNewValue = Number(oValueString) + 1;
        }
    }

    req.data.orderNumber = String(oNewValue);

    ItemsNumerators(req.data.orderItems, "item");

};

async function ProposalNumerator(req, tx) {
    
    const oValueInit = "8000000000"

    let oProposal = await tx.read(cds.services.CatalogService.entities.Proposal, ['max(proposalNumber)']);

    let oNewValue = oValueInit;

    if(oProposal.length != 0) {
        let oValueString = oProposal[0]['MAX(PROPOSALNUMBER)'];

        if(oValueString != null) {
            oNewValue = Number(oValueString) + 1;
        }
    }

    req.data.proposalNumber = String(oNewValue);

    ItemsNumerators(req.data.proposalItems, "proposalItemNumber");

};

function ItemsNumerators(sItems, sPath) {
    let oCount = 1

    sItems.map(sItem => {
        sItem[sPath] = ("000" + oCount).slice(-3);
        oCount++;
    });
};

module.exports = { 
    StatusOrderNumerator, 
    StatusCustomerNumerator, 
    ProductNumerator, 
    OrdersNumerator, 
    ProposalNumerator 
};