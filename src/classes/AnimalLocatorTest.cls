@isTest
private class AnimalLocatorTest{
    
    @isTest static void getAnimalLocatorTest() {
        System.debug('getAnimalLocatorTest Entry : ');
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());         
        System.assertEquals(AnimalLocator.getAnimalNameById(1), 'chicken');
    }
}