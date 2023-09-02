const cds = require('@sap/cds');


async function loadProducts (req){
    const { Products } = cds.entities;  

    //Eliminar produtos
    await DELETE(Products);


    //Inserir produtos
    let insertedProducts = await INSERT([
        {
            "ID": "14aef69c-6e01-427e-b847-fa97d1fe2bce",
            "createdAt": "2022-11-27T19:02:13.631Z",
            "createdBy": "anonymous",
            "modifiedAt": "2022-11-27T19:02:13.631Z",
            "modifiedBy": "anonymous",
            "code": "7000000000",
            "productName": "Lenço De Papel Softy's",
            "productDescription": "Lenço De Papel Softy's Elite Folha Dupla 75 Unidades",
            "productValue": "10.00",
            "productActive": true
        }
    ]).into(Products);
}

module.exports = {
    loadProducts
}