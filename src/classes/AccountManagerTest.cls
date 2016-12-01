@IsTest
private class AccountManagerTest {

    @isTest static void getAccountTest() {
        Id accountId = createAccountTestRecord();
       
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'https://chrisgar-dev-ed.my.salesforce.com/services/apexrest/Accounts/'+ accountId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test Account', thisAccount.Name);
    }
    
    // Helper method
    static Id createAccountTestRecord() {
        // Create test record
        Account accountTest = new Account(
            Name = 'Test Account'
        );
        insert accountTest;
        
        createContactTestRecord(accountTest.Id, 1);
        return accountTest.Id;
    } 
    
    static void createContactTestRecord(Id accountId, Integer numberOfContacts) {
        // Create test record
        List<Contact> contactList = new List<Contact>();
        for(Integer i=0;i<numberOfContacts;i++){
             Contact contactTest = new Contact(
                 AccountId = accountId,
                 FirstName = 'Tester',
                 LastName = 'User'+ i
             );
            contactList.add(contactTest);            
        }       
        insert contactList;
    } 
}