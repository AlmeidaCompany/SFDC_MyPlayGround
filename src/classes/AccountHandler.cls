public class AccountHandler {
    public static Account insertNewAccount(String accountName){
        Account newAccountRec = new Account(Name = accountName);
        try{
            insert newAccountRec;            
        }catch(DMLException e){
            newAccountRec = null;
        }
        return newAccountRec;        
    }
}