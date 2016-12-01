public class TransanctionControl {
    
    public static void insertAccount(String accName, String accNumber){
        Account a = new Account(Name = accName, AccountNumber = accNumber);

        insert a; 
        System.debug('a.Id : '+ a.Id);
        System.assertEquals(accNumber, [SELECT AccountNumber FROM Account WHERE Id =: a.Id].AccountNumber);
        
        SavePoint sp1 = Database.setSavepoint();
        
        a.AccountNumber = '999999';
        update a;
        System.assertEquals('999999', [SELECT AccountNumber FROM Account WHERE Id =: a.Id].AccountNumber);
        SavePoint sp2 = Database.setSavepoint();
        
        a.AccountNumber = '888888';
        update a;
        System.assertEquals('888888', [SELECT AccountNumber FROM Account WHERE Id =: a.Id].AccountNumber);
        SavePoint sp3 = Database.setSavepoint();
        //Database.rollback(sp1);        
        Database.rollback(sp2);
        //System.assertEquals(null, [SELECT AccountNumber FROM Account WHERE Id =: a.Id].AccountNumber);
       
        
    }
    


}