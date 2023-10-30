sap.ui.define([], function () {
    "use strict";

    return {

        initDateHours: function() {
            return sap.ui.core.format.DateFormat.getDateTimeInstance({
                pattern: "yyyy-MM-ddTHH:mm:ss",
                UTC: false
            }).format(new Date());
        },

        converterDate: function(sDate) {
            return sap.ui.core.format.DateFormat.getDateTimeInstance({
                pattern: "yyyy-MM-dd",
                UTC: false
            }).format(sDate);
        },

        /**
         * Rounds the number unit value to 2 digits
         * @public
         * @param {string} sValue the number string to be rounded
         * @returns {string} sValue with 2 digits rounded
         */
        numberUnit : function (sValue) {
            if (!sValue) {
                return "";
            }
            return parseFloat(sValue).toFixed(2);
        },

        cnpj : function (sValue) {
            if (!sValue) {
                return "";
            }    
            sValue = sValue.padStart(14, "0")
            return `${sValue.substring(0,2)}.${sValue.substring(2,5)}.${sValue.substring(5,8)}/${sValue.substring(8,12)}-${sValue.substring(12,14)}`;
        },

        cep : function (sValue) {
            if (!sValue) {
                return "";
            }    
            sValue = sValue.padStart(8, "0");
            return `${sValue.substring(0,5)}-${sValue.substring(5,8)}`;
        },
        
        telephone: function(sValue) {
            if (!sValue) {
                return "";
            }    
            sValue = sValue.padStart(11, "0");
            return `(${sValue.substring(0,2)}) ${sValue.substring(2,3)} ${sValue.substring(3,7)}-${sValue.substring(7,11)}`;
        }

    };

});