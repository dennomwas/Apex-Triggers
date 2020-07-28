@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 3 9 ? 2020';
    static testmethod  void TestDailyLeadProcessorJob() {
        // In the test class, insert 200 Lead records, 
        //schedule the DailyLeadProcessor class to run
        // test that all Lead records were updated correctly.
        List<Lead>testList = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testList.add(new Lead(
                                LastName = 'Test Lead '+i,
                                Company = 'Africolt',
                                Status = 'Open-Not Contacted'
            ));
        }
        insert testList; 
        Test.startTest();
        String jobId = System.schedule('Scheduled Lead Source Job', 
                                        CRON_EXP, 
                                        new DailyLeadProcessor());
        Test.stopTest(); 

    }
}
