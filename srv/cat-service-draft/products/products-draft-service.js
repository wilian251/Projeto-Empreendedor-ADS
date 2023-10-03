const cds = require('@sap/cds');
const { getBundle } = require('../../common/i18n');

class ProductsServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - Products                                                                //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'ProductsFiori', async (req) => {
            const tx   = cds.transaction(req);

            let bundle = getBundle(req.user.locale),
                oCode  = req.data.productCode.replace(" ","");
                    
            let oProduct =  await tx.read(cds.services.CatalogService.entities.Products, ['ID'])
                                .where(
                                    { 
                                        productCode: oCode
                                    }
                                );

            if (oProduct.length > 0) {
                const txt = bundle.getText("mERROR_UNIQUE",[req.data.productCode, bundle.getText("code")]);
                return req.error(410, txt);
            }
        });

        //----------------------------------------------------------------------------------//
        // UPDATE - Products                                                                //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'ProductsFiori', async (req) => {
            let bundle = getBundle(req.user.locale);
            const tx = cds.transaction(req);
            //Validar productCode
            let oCode = req.data.productCode?.replace(" ","");     
            if (oCode) {
                let oProduct =  await tx.read(cds.services.CatalogService.entities.Products, ['ID']).where(
                    { 
                        ID: {
                            '<>': req.data.ID
                        },
                        productCode: oCode
                    }
                );
                if (oProduct.length > 0) {
                    const txt = bundle.getText("mERROR_UNIQUE",[req.data.productCode, bundle.getText("code")]);
                    return req.error(410, txt);
                }
            }
        });

        
        return super.init();
    }
}

module.exports = { ProductsServiceDraft };