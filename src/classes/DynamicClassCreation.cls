public class DynamicClassCreation {
    
    public String p {get; private set;}
    
    public DynamicClassCreation(){
        System.debug('Check DynamicClassCreation');
        p = 'please';
    }
    public DynamicClassCreation(String arg){
        p = arg;
    }
    
    public static void doSomethingAfterUpdate(Map<Id, SObject> objMap){
        System.debug('doSomethingAfterUpdate : ' + objMap);
    }

}