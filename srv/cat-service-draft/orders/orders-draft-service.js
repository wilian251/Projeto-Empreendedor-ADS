const cds = require('@sap/cds');
const { getBundle } = require('../../common/i18n');

class OrdersServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - Orders                                                                  //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'OrdersFiori', async (req) => {
            const tx   = cds.transaction(req);

            let bundle       = getBundle(req.user.locale),
                oOrderNumber = req.data.orderNumber.replace(" ","");
                    
            let oOrders =  await tx.read(cds.services.CatalogService.entities.Orders, ['ID'])
                                .where(
                                    { 
                                        orderNumber: oOrderNumber
                                    }
                                );

            if (oOrders.length > 0) {
                const txt = bundle.getText("mERROR_UNIQUE",[req.data.orderNumber, bundle.getText("orderNumber")]);
                return req.error(410, txt);
            }
        });

        //----------------------------------------------------------------------------------//
        // UPDATE - Orders                                                                  //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'OrdersFiori', async (req) => {
            const tx   = cds.transaction(req);

            let bundle       = getBundle(req.user.locale),
                oOrderNumber = req.data.orderNumber?.replace(" ","");

            //Validar Email     
            if (oOrderNumber) {
                let oOrders = await tx.read(cds.services.CatalogService.entities.Orders, ['ID']).where(
                    { 
                        ID: {
                            '<>': req.data.ID
                        },
                        orderNumber: oOrderNumber
                    }
                );
                if (oOrders.length > 0) {
                    const txt = bundle.getText("mERROR_UNIQUE",[req.data.orderNumber, bundle.getText("orderNumber")]);
                    return req.error(410, txt);
                }
            }
        });

        
        return super.init();
    }
}

module.exports = { OrdersServiceDraft };