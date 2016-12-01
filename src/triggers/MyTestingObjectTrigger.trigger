trigger MyTestingObjectTrigger on My_Testing_Object__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    if(trigger.isBefore && trigger.isUpdate){
    	for(My_Testing_Object__c m : Trigger.new){
            m.Test__c += 1;
            System.debug('Check 1 : '+ m.Test__c);
        }  
    }
    
   
}

 /*String doggie = 'DynamicClassCreation'; 
	Type objType = Type.forName(doggie);
    testDispatcher.handleTrigger(objType);
    
    MyTestingObjectTriggerHandler handler = new MyTestingObjectTriggerHandler();

    if(Trigger.isInsert && Trigger.isBefore){
                
        handler.OnBeforeInsert(Trigger.new);
    } 
    if(Trigger.isUpdate && Trigger.isBefore && MyTestingObjectTriggerHandler.firstOnBeforeUpdate){       
        
        handler.OnBeforeUpdate(Trigger.old, Trigger.oldMap, Trigger.new, Trigger.newMap);   
        MyTestingObjectTriggerHandler.firstOnBeforeUpdate = false;
    } 
    if(Trigger.isUpdate && Trigger.isAfter && MyTestingObjectTriggerHandler.firstAfterUpdate){       
        
        handler.OnAfterUpdate(Trigger.old, Trigger.oldMap, Trigger.new, Trigger.newMap);  
        MyTestingObjectTriggerHandler.firstAfterUpdate = false;
    } 
*/