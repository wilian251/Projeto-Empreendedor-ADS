const cds   = require('@sap/cds');
const xsenv = require("@sap/xsenv");

class OrdersServiceDraft extends cds.ApplicationService {
    init() {
        
        //----------------------------------------------------------------------------------//
        // INIT - Instanciando S3                                                           //
        //----------------------------------------------------------------------------------//
        xsenv.loadEnv();

        
        return super.init();
    }
}

module.exports = { OrdersServiceDraft };