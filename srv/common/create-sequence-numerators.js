const func = require('@cap-js/postgres/lib/func');
const cds = require('@sap/cds');

async function OrdersNumerator(req) {
    
    const tx = cds.transaction(req);
            
    let oOrder = await tx.read(cds.services.CatalogService.entities.Orders, ['max(orderNumber)']);
    
    let oNewValue = "";

    if(oOrder.length != 0) {
        let oValueString = oOrder[0]['MAX(ORDERNUMBER)'];
        let oValue       = Number(oValueString);
        
        oNewValue = oValue + 1;
    }else {
        oNewValue = "7000000000"; 
    }

    req.data.orderNumber = String(oNewValue);

    ItemsNumerators(req.data.orderItems, "item");

};

async function ProposalNumerator(req) {

    const tx = cds.transaction(req);
            
    let oProposal = await tx.read(cds.services.CatalogService.entities.Proposal, ['max(proposalNumber)']);

    let oNewValue = "";

    if(oProposal.length != 0) {
        let oValueString = oProposal[0]['MAX(PROPOSALNUMBER)'];
        let oValue       = Number(oValueString);
        
        oNewValue = oValue + 1;
    }else {
        oNewValue = "8000000000"; 
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

module.exports = { OrdersNumerator, ProposalNumerator }