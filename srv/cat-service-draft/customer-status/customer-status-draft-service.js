const cds           = require('@sap/cds');
const { getBundle } = require('../../common/i18n');
const { StatusCustomerNumerator } = require("../../common/create-sequence-numerators");

class CustomerStatusServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - StatusCustomer                                                          //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'CustomerStatusFiori', async (req) => {
            const tx = cds.transaction(req);

            //Cria o Número sequencial
            await StatusCustomerNumerator(req, tx);

            let bundle        = getBundle(req.user.locale),
                oStatusNumber = req.data.customerStatusNumber.replace(" ","");
                    
            let oStatus = await tx.read(cds.services.CatalogService.entities.StatusCustomer, ['ID'])
                                .where(
                                    { 
                                        customerStatusNumber: oStatusNumber
                                    }
                                );

            if (oStatus.length > 0) {
                const txt = bundle.getText("mERROR_UNIQUE",[req.data.customerStatusNumber, bundle.getText("customerStatusNumber")]);
                return req.error(410, txt);
            }
        });

        //----------------------------------------------------------------------------------//
        // UPDATE - StatusCustomer                                                          //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'CustomerStatusFiori', async (req) => {
            const tx = cds.transaction(req);

            let bundle = getBundle(req.user.locale),
                oStatusNumber = req.data.customerStatusNumber?.replace(" ","");

            //Validar Status
            if (oStatusNumber) {
                let oStatus = await tx.read(cds.services.CatalogService.entities.StatusCustomer, ['ID']).where(
                    { 
                        ID: {
                            '<>': req.data.ID
                        },
                        customerStatusNumber: oStatusNumber
                    }
                );
                
                if (oStatus.length > 0) {
                    const txt = bundle.getText("mERROR_UNIQUE",[req.data.customerStatusNumber, bundle.getText("customerStatusNumber")]);
                    return req.error(410, txt);
                }
            }
        });

        
        return super.init();
    }
}

module.exports = { CustomerStatusServiceDraft };