@isTest
public class AddPrimaryContactTest {  
 
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < 100; i++) {
            Account acc = new Account();
            acc.Name = 'Account Name '+ 1;
            if(i<50){
            	acc.BillingState = 'NY';    
            }else{
                acc.BillingState = 'CA';  
            }
            accounts.add(acc);
        }
        insert accounts;        
    }
    
    static testmethod void testQueueable() {
        Contact c = new Contact(FirstName = 'First Name', LastName = 'Last Name');
        
        AddPrimaryContact updater = new AddPrimaryContact(c, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE Account.BillingState = 'CA']);
    }
}