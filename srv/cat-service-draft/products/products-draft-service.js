const cds   = require('@sap/cds');
const xsenv = require("@sap/xsenv");

class ProductsServiceDraft extends cds.ApplicationService {
    init() {
        
        //----------------------------------------------------------------------------------//
        // INIT - Instanciando S3                                                           //
        //----------------------------------------------------------------------------------//
        xsenv.loadEnv();

        
        return super.init();
    }
}

module.exports = { ProductsServiceDraft };