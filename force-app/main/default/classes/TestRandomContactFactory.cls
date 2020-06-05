@isTest
public class TestRandomContactFactory {

    @isTest static void  TestContactIsCreated() {
        // Create test data
        List<Contact> testList = new List<Contact>();
        for (Integer i = 0; i < 2; i++) {
            testList.add(new Contact(LastName = 'contactName '+i));
        }
        // Perform test
        List<Contact> actualList = RandomContactFactory.generateRandomContacts(2, 'contactName');

        // Assert results
        System.assertEquals(actualList, TestList);
        System.assert(actualList.size() > 0 );
    }
}
