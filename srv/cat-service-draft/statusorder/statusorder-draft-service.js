const cds           = require('@sap/cds');
const { getBundle } = require('../../common/i18n');
const { StatusOrderNumerator } = require("../../common/create-sequence-numerators");

class StatusOrderServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - StatusOrder                                                             //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'StatusOrderFiori', async (req) => {
            const tx = cds.transaction(req);

            //Cria Número sequencial
            await StatusOrderNumerator(req, tx);

            let bundle        = getBundle(req.user.locale),
                oStatusNumber = req.data.orderStatusNumber.replace(" ","");
                    
            let oStatus = await tx.read(cds.services.CatalogService.entities.StatusOrder, ['ID'])
                                .where(
                                    { 
                                        orderStatusNumber: oStatusNumber
                                    }
                                );

            if (oStatus.length > 0) {
                const txt = bundle.getText("mERROR_UNIQUE",[req.data.orderStatusNumber, bundle.getText("orderStatusNumber")]);
                return req.error(410, txt);
            }
        });

        //----------------------------------------------------------------------------------//
        // UPDATE - StatusOrder                                                             //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'StatusOrderFiori', async (req) => {
            const tx = cds.transaction(req);

            let bundle = getBundle(req.user.locale),
                oStatusNumber = req.data.orderStatusNumber?.replace(" ","");

            //Validar Status
            if (oStatusNumber) {
                let oStatus = await tx.read(cds.services.CatalogService.entities.StatusOrder, ['ID']).where(
                    { 
                        ID: {
                            '<>': req.data.ID
                        },
                        orderStatusNumber: oStatusNumber
                    }
                );
                
                if (oStatus.length > 0) {
                    const txt = bundle.getText("mERROR_UNIQUE",[req.data.orderStatusNumber, bundle.getText("orderStatusNumber")]);
                    return req.error(410, txt);
                }
            }
        });

        
        return super.init();
    }
}

module.exports = { StatusOrderServiceDraft };