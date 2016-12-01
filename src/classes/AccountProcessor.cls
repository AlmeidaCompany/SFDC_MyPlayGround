public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> accountsToUpdate = new List<Account>();
        for(Account a : [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : accountIds]){
            a.Number_of_Contacts__c = a.Contacts.size();
            accountsToUpdate.add(a);
        }
        update accountsToUpdate;
    }

}