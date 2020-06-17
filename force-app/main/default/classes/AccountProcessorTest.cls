@isTest
public class AccountProcessorTest {

    @isTest static void AccountProcessorTest() {
        // Test data
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 4; i++) {
            testAccounts.add(new Account(
                                        Name = 'Test Account '+i));
        }
        insert testAccounts;

        List<Account> testAccountsList = [SELECT Id FROM Account];
        List<Contact> testContacts = new List<Contact>();
        for (Account testAccount : testAccountsList) {
            testContacts.add(new Contact(
                                        LastName = 'test Contact',
                                        AccountId = testAccount.Id));  
        }        
        insert testContacts;
        
        List<Id> testIDs = new List<Id>();
        for (Account accnt : testAccountsList) {
            testIDs.add(accnt.Id);
        }
        //Perform Test
        Test.startTest();
        AccountProcessor.countContacts(testIDs);
        Test.stopTest();

        // Assert results
        Account testAccountData = [SELECT Id, Number_of_Contacts__c 
                                    FROM Account WHERE Id = :testIDs[0]];
        
        System.assertEquals(testAccountData.Number_of_Contacts__c , 1);
        
    }
}
