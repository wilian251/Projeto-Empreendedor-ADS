const cds           = require('@sap/cds');
const { getBundle } = require('../../common/i18n');

class CustomerServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - Customer                                                                //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'CustomerFiori', async (req) => {
            const tx   = cds.transaction(req);

            let bundle = getBundle(req.user.locale),
                oCNPJ  = req.data.CNPJ.replace(" ","");
                    
            let oCustomer =  await tx.read(cds.services.CatalogService.entities.Customer, ['ID'])
                                .where(
                                    { 
                                        CNPJ: oCNPJ
                                    }
                                );

            if (oCustomer.length > 0) {
                const txt = bundle.getText("mERROR_UNIQUE",[req.data.CNPJ, bundle.getText("CNPJ")]);
                return req.error(410, txt);
            }
        });

        //----------------------------------------------------------------------------------//
        // UPDATE - Customer                                                                //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'CustomerFiori', async (req) => {
            const tx = cds.transaction(req);

            let bundle = getBundle(req.user.locale),
                oCNPJ  = req.data.CNPJ?.replace(" ","");

            //Validar Email     
            if (oCNPJ) {
                let oCustomer = await tx.read(cds.services.CatalogService.entities.Customer, ['ID']).where(
                    { 
                        ID: {
                            '<>': req.data.ID
                        },
                        CNPJ: oCNPJ
                    }
                );
                if (oCustomer.length > 0) {
                    const txt = bundle.getText("mERROR_UNIQUE",[req.data.CNPJ, bundle.getText("CNPJ")]);
                    return req.error(410, txt);
                }
            }
        });

        
        return super.init();
    }
}

module.exports = { CustomerServiceDraft };