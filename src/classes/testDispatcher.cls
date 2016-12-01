public virtual class testDispatcher implements InterfaceHandler {
	public static void handleTrigger(Schema.sObjectType soType){
        System.debug('Check 1 : ClassName'+ soType);
        System.debug('Check 2 : isBefore '+ Trigger.isBefore);
        System.debug('Check 3 : isInsert '+ Trigger.isInsert);
        System.debug('Check 4 : IsUpdate '+ Trigger.IsUpdate);
        System.debug('Check 5 : isDelete '+ Trigger.isDelete);
        System.debug('Check 6 : isUndelete '+ Trigger.isUndelete);
        System.debug('Check 7 : new '+ Trigger.new);
        System.debug('Check 8 : newMap'+ Trigger.newMap);
        System.debug('Check 9 : old'+ Trigger.old);
        System.debug('Check 10 : oldMap'+ Trigger.oldMap);
        System.debug('Check 11 : isAfter'+ Trigger.isAfter);
        
    }
    
    public void OnAfterUpdate(String s){
        System.debug('I do not know '  + s);
    }

}