const cds   = require('@sap/cds');
const xsenv = require("@sap/xsenv");

class CustomerServiceDraft extends cds.ApplicationService {
    init() {
        
        //----------------------------------------------------------------------------------//
        // INIT - Instanciando S3                                                           //
        //----------------------------------------------------------------------------------//
        xsenv.loadEnv();

        
        return super.init();
    }
}

module.exports = { CustomerServiceDraft };