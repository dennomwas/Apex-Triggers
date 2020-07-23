@isTest
public class AddPrimaryContactTest {
    
    @TestSetup
    static void makeData(){
        // Test Data
        List<Account> testAccountList = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            testAccountList.add(new Account(Name = 'Test Account '+i));          
        }
        insert testAccountList;
        System.debug(testAccountList);

        List<Account> testAccountQuery = [SELECT Id FROM Account LIMIT 10];

        List<Contact>cloneContactList = new List<Contact>();
        for (Account testAccount : testAccountQuery) {
            cloneContactList.add(new Contact( 
                                            LastName = 'Batch Contact', 
                                            AccountId = testAccount.Id));
        }  
        insert cloneContactList;    
    }
    static testmethod void testContactsCreated(){  
        Contact testContactObj = [SELECT Id FROM Contact LIMIT 1];
        String state = 'Batch Contact';
        AddPrimaryContact contactQueueJob = new AddPrimaryContact(testContactObj, state );

        Test.startTest();
        System.enqueueJob(contactQueueJob);
        Test.stopTest();  

        System.assertEquals(testContactObj.LastName, 'Batch Contact');
    }
}
