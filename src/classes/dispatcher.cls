public class dispatcher extends testDispatcher {
    
    public override void onAfterUpdate(Map<Id,sObject> triggerNewMap){
        
        System.debug('Here we are : '+ triggerNewMap);
    }

}