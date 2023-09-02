const cds = require('@sap/cds');
const { getBundle } = require('./i18n');

async function ProductCreate(req){
    let bundle = getBundle(req.user.locale);
    const tx = cds.transaction(req);
    let oCode = req.data.code.replace(" ","");
            
    let oProduct =  await tx.read(cds.services.CatalogService.entities.Products, ['ID'])
                        .where(
                            { 
                                code: oCode
                            }
                        );

    if (oProduct.length > 0) {
        const txt = bundle.getText("mERROR_UNIQUE",[req.data.code, bundle.getText("mCode")]);
        return req.error(410, txt);
    }
};

async function ProductUpdate(req){
    let bundle = getBundle(req.user.locale);
    const tx = cds.transaction(req);
    //Validar code
    let oCode = req.data.code?.replace(" ","");     
    if (oCode) {
    let oProduct =  await tx.read(cds.services.CatalogService.entities.Products, ['ID'])
                        .where(
                        { 
                            ID: {
                                '<>': req.data.ID
                            },
                            code: oCode
                        }
                    );
        if (oProduct.length > 0) {
            const txt = bundle.getText("mERROR_UNIQUE",[req.data.code, bundle.getText("mCode")]);
            return req.error(410, txt);
        }
    }
};

async function ProductDelete(req){
    let bundle = getBundle(req.user.locale);

    const tx = cds.transaction(req);
    let oCode = req.data.code?.replace(" ","");
            
    if (oCode) {
    let oProduct =  await tx.read(cds.services.CatalogService.entities.Products, ['ID'])
                        .where(
                        { 
                            ID: {
                                '<>': req.data.ID
                            },
                            code: oCode
                        }
                    );
        if (oProduct.length > 0) {
            const txt = bundle.getText("mERROR_UNIQUE",[req.data.code, bundle.getText("mCode")]);
            return req.error(410, txt);
        }
    }
};

module.exports = {
    ProductCreate,
    ProductUpdate,
    ProductDelete
}