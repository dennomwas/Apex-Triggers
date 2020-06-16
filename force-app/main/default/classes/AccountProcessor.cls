public class AccountProcessor {

    @future 
    public static void countContacts(List<Id> accountIDs) {
    // For each Account ID passed to the method, 
    // count the number of Contact records associated to it
    // update the 'Number_of_Contacts__c' field with this value
        
        List<Account> accountToUpdate = new List<Account>();

        for (Id accountID : accountIDs) {   
            AggregateResult totalCount = [SELECT COUNT(Id) contactCount
                                            FROM Contact 
                                            WHERE Account.Id = :accountID];
            System.debug('totalCount '+totalCount + ' accountID '+accountID);
            accountToUpdate.add(new Account(
                                            Id = accountID,
                                            Number_of_Contacts__c = (Decimal) totalCount.get('contactCount')));
        }
        System.debug('accountToUpdate '+accountToUpdate);
        if (accountToUpdate.size() > 0) {
            try {
                update accountToUpdate;
            } catch (DmlException e) {
                System.debug(e.getMessage());
            }          
        }                                       
    }    
}
