@isTest
public class TestRestrictContactByName {

    @isTest static void TestInvalidContactName() {
        // Test data
        Contact testContact = new Contact(
            LastName = 'INVALIDNAME'
        );

        // Perform Test
        Test.startTest();
        Database.SaveResult results = Database.insert(testContact, false);
        Test.stopTest();

        // Assert results
        System.assertEquals(results.isSuccess(), false);
        System.assertEquals('The Last Name "'+testContact.LastName+'" is not allowed for DML', 
                            results.getErrors()[0].getMessage());

    }
}
