@isTest
public class AccountProcessorTest {

    @isTest static void AccountProcessorTest() {
        // Test data
        Account testAccount = new Account(
            Name = 'Test Account'
        );
        insert testAccount;
        
        Contact testContact = new Contact(
            LastName = 'test Contact',
            AccountId = testAccount.Id
        );    
        insert testContact;
        
        List<Id> testIDs = new List<Id>();
        testIDs.add(testAccount.Id);

        //Perform Test
        Test.startTest();
        AccountProcessor.countContacts(testIDs);
        Test.stopTest();

        // Assert results
        Account testAccountData = [SELECT Id, Number_of_Contacts__c 
                                    FROM Account WHERE Id = :testAccount.Id];
        
        System.assertEquals(testAccountData.Number_of_Contacts__c , 1);
        
    }
}
