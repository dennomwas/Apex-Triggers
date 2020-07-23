@isTest
private class LeadProcessorTest {
    @TestSetup
    static void setup(){
        // Test data
        List<Lead> testList = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testList.add(new Lead(
                LastName   = 'Test Name '+i,
                Company    = 'Africolt',
                Status     = 'Open - Not Contacted',
                LeadSource = 'Dreamforce'
            ));          
        }
        insert testList;
    }
    static testmethod void testLeadSource() {        
        Test.startTest();
        LeadProcessor batchLeadSourceTest = new LeadProcessor();
        Id batchId = Database.executeBatch(batchLeadSourceTest);
        Test.stopTest();
        Lead leadQuery = [SELECT Id, LeadSource FROM Lead LIMIT 1];
        System.assertEquals(leadQuery.Leadsource, 'Dreamforce');
    }
    static testmethod void testBatchNumber() {
        Test.startTest();
        LeadProcessor batchNumberTest = new LeadProcessor();
        Id batchId = Database.executeBatch(batchNumberTest);
        Test.stopTest();
        Integer leadCount = [SELECT Count() FROM Lead];
        System.assertEquals(leadCount, 200);
    }
}
