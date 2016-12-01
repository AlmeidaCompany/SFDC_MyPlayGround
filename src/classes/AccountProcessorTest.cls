@isTest
public class AccountProcessorTest {	
    
    @isTest static void countContactsTest(){
        Account a = new Account(
            Name = 'Future account'
        );
        insert a;
        Contact c = new Contact(
        	FirstName = 'Test', 
            LastName = 'Number 1', 
            AccountId = a.Id
        );
        insert c;
        List<Id> accountId = new List<Id>{a.Id};
        Test.startTest();
        AccountProcessor.countContacts(accountId);
        Test.stopTest();
        System.assertEquals([SELECT Number_of_Contacts__c FROM Account WHERE Id IN :accountId ].Number_of_Contacts__c, 1);     
    }    
}