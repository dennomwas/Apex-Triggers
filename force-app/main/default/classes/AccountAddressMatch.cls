public with sharing class AccountAddressMatch {

    public static void MatchShippingAndBillingAddress() {
 
        // check for a checkbox, if the checkbox field is true, 
        // set the Shipping Postal Code (whose API name is ShippingPostalCode) 
        // to be the same as the Billing Postal Code (BillingPostalCode).

        List<Account> queriedAccounts = [SELECT BillingPostalCode, ShippingPostalCode, Match_Billing_Address__c 
                                        FROM Account 
                                        WHERE Match_Billing_Address__c = true];
        
        // With 'AccountAddressTrigger' active, 
        // if an Account has a Billing Postal Code and 'Match_Billing_Address__c' is true, 
        // the record should have the Shipping Postal Code set to match on insert or update.

        for (Account acc : queriedAccounts) {
            if (acc.BillingPostalCode != null) {
                System.debug('BillingPostalCode '+ acc.BillingPostalCode);

                acc.ShippingPostalCode = acc.BillingPostalCode;
                System.debug('ShippingPostalCode '+ acc.ShippingPostalCode);
            }
        }

            
        }
        

}
