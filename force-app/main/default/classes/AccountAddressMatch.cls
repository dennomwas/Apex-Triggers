public with sharing class AccountAddressMatch {

    public static void AccountAddressMatch() {
 
        // check for a checkbox, if the checkbox field is true, 
        // set the Shipping Postal Code (whose API name is ShippingPostalCode) 
        // to be the same as the Billing Postal Code (BillingPostalCode).

        Account queriedAccounts = [SELECT Name, Match_Billing_Address__c 
                                    FROM Account 
                                    WHERE Match_Billing_Address__c = true ];

        for ( Account queryAccount : queriedAccounts) {
            try {
                Account newAccount = new Account(
                    ShippingPostalCode = BillingPostalCode
                );
                insert newAccount;
                
            } catch (DmlException e) {
                System.debug('The error message is ' + e.getMessage());
            }
        }

    }
}
