const cds = require('@sap/cds');
const fetch = require('node-fetch');


async function getEANAPI(req) {
    let barcode = req.data.barcode;

    if (barcode) {
        try {
        
            const url = `https://barcode.monster/api/${barcode}` 
            const method = "GET";
            const headers = new fetch.Headers();

            headers.set("Content-Type", 'application/json');

            const result = await fetch(url, { method:method, headers:headers }).then((res)=>{
                return res.json()
            });
            
            return {
                barcode: result.code,
                productName: result.description.replace("(from barcode.monster)", ""),
                brand: result.company,
                imageUrl: result.image_url
            }

    
        } catch (error) {
            console.log(error);
            req.error(410, error.message);
            return;    
        }
    }
}

module.exports = {

    getEANAPI
}