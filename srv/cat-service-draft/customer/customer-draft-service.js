const cds = require('@sap/cds');

class CustomerServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - Customer                                                                   //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'CustomerFiori', async (req) => {

        });

        //----------------------------------------------------------------------------------//
        // UPDATE - Customer                                                                   //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'CustomerFiori', async (req) => {

        });

        
        return super.init();
    }
}

module.exports = { CustomerServiceDraft };