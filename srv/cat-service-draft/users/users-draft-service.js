const cds = require('@sap/cds');

class UsersServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - Users                                                                   //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'UsersFiori', async (req) => {

        });

        //----------------------------------------------------------------------------------//
        // UPDATE - Users                                                                   //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'UsersFiori', async (req) => {

        });


        return super.init();
    }
}

module.exports = { UsersServiceDraft };