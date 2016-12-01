public class FactoryTrigger {
    
    public static void createAndExecuteTrigger(){
        
    }
    
    private static TriggerEventsHandler getHandler(Type t) {
        // Instantiate the type
        Object o = t.newInstance();
 
        // if its not an instance of TriggerEventsHandler return null
        if (!(o instanceOf TriggerEventsHandler)){
            return null;
        }
 
        return (TriggerEventsHandler)o;
    }
 
    public class TriggerException extends Exception {}

}