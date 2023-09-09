const cds = require('@sap/cds');

class ProductsServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - Products                                                                   //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'ProductsFiori', async (req) => {

        });

        //----------------------------------------------------------------------------------//
        // UPDATE - Products                                                                   //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'ProductsFiori', async (req) => {

        });

        
        return super.init();
    }
}

module.exports = { ProductsServiceDraft };