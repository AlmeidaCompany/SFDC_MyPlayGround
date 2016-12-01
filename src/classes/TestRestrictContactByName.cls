@isTest
public class TestRestrictContactByName {
    
    @isTest static void RestrictContactByNameTest(){
    	Contact c = new Contact(LastName = 'INVALIDNAME');
        Test.startTest();
        Database.SaveResult sr = Database.insert(c, false);
        Test.stopTest();
        System.assert(!sr.isSuccess());
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', sr.getErrors()[0].getMessage());
        
    }
}