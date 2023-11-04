const cds = require('@sap/cds');
const { ProposalNumerator } = require("../common/create-sequence-numerators");

class CatalogService extends cds.ApplicationService {
    init() {

        this.before("CREATE", "Proposal", async (req) => {
            const tx = cds.transaction(req);

            await ProposalNumerator(req, tx);
        });
        
        return super.init();
    }
}

module.exports = { CatalogService };
