const cds = require('@sap/cds');

class OrdersServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - Orders                                                                  //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'OrdersFiori', async (req) => {

        });

        //----------------------------------------------------------------------------------//
        // UPDATE - Orders                                                                  //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'OrdersFiori', async (req) => {

        });

        
        return super.init();
    }
}

module.exports = { OrdersServiceDraft };