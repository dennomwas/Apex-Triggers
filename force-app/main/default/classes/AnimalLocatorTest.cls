@isTest
private class AnimalLocatorTest {

    @isTest static void AnimalLocatorTest() {
        // Set mock callout class
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        // Test your class method
        String testResult = AnimalLocator.getAnimalNameById(1);
        // Assert your results
        System.assertEquals(200, respnse.getStatusCode());
        System.assertEquals('chicken', testResult);
    }
}
