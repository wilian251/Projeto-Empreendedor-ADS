const func = require('@cap-js/postgres/lib/func');
const cds = require('@sap/cds');

async function OrdersNumerator(req) {
    
    const tx = cds.transaction(req);
            
    let oOrder       =  await tx.read(cds.services.CatalogService.entities.Orders, ['max(orderNumber)']);
    let oValueString = oOrder[0]['MAX(ORDERNUMBER)'];
    let oValue       = Number(oValueString);
    let oNewValue    = oValue + 1;

    req.data.orderNumber = String(oNewValue);

};

async function ProposalNumerator(req) {

    const tx = cds.transaction(req);
            
    let oProposal    =  await tx.read(cds.services.CatalogService.entities.Proposal, ['max(proposalNumber)']);
    let oValueString = oProposal[0]['MAX(PROPOSALNUMBER)'];
    let oValue       = Number(oValueString);
    let oNewValue    = oValue + 1;

    req.data.proposalNumber = String(oNewValue);

};

function ItemsNumerators(sItems) {
    sItems.map(sItem => {

    });
};

module.exports = { OrdersNumerator, ProposalNumerator }