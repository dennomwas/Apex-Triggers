trigger AccountAddressTrigger on Account (before insert, before update) {

    for ( Account acc : Trigger.new ) {
        if (acc.BillingPostalCode != null && Match_Billing_Address__c == true) {
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }

}