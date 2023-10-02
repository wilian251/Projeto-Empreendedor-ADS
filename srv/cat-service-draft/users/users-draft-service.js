const cds = require('@sap/cds');
const { getBundle } = require('../../common/i18n');

class UsersServiceDraft extends cds.ApplicationService {
    init() {

        //----------------------------------------------------------------------------------//
        // CREATE - Users                                                                   //
        //----------------------------------------------------------------------------------//
        this.before('CREATE', 'UsersFiori', async (req) => {
            const tx   = cds.transaction(req);

            let bundle = getBundle(req.user.locale),
                oEmail = req.data.userEmail.replace(" ","");
                    
            let oUsers =  await tx.read(cds.services.CatalogService.entities.Users, ['ID'])
                                .where(
                                    { 
                                        userEmail: oEmail
                                    }
                                );

            if (oUsers.length > 0) {
                const txt = bundle.getText("mERROR_UNIQUE",[req.data.userEmail, bundle.getText("email")]);
                return req.error(410, txt);
            }
        });

        //----------------------------------------------------------------------------------//
        // UPDATE - Users                                                                   //
        //----------------------------------------------------------------------------------//
        this.before('UPDATE', 'UsersFiori', async (req) => {
            let bundle = getBundle(req.user.locale);
            const tx   = cds.transaction(req);
            //Validar Email
            let oEmail = req.data.userEmail?.replace(" ","");     
            if (oEmail) {
                let oUsers = await tx.read(cds.services.CatalogService.entities.Users, ['ID']).where(
                    { 
                        ID: {
                            '<>': req.data.ID
                        },
                        userEmail: oEmail
                    }
                );
                if (oUsers.length > 0) {
                    const txt = bundle.getText("mERROR_UNIQUE",[req.data.userEmail, bundle.getText("email")]);
                    return req.error(410, txt);
                }
            }
        });


        return super.init();
    }
}

module.exports = { UsersServiceDraft };