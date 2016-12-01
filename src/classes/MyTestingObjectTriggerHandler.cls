public class MyTestingObjectTriggerHandler {
    
    public static Boolean firstAfterUpdate = true;
    public static Boolean firstOnBeforeUpdate = true;
    
	public void OnBeforeInsert(My_Testing_Object__c[] newMyTestObjs){  
    }
    
    public void OnBeforeUpdate(My_Testing_Object__c[] oldMyTestObjs, Map<Id,My_Testing_Object__c> oldMyTestObjMap, My_Testing_Object__c[] newMyTestObjs, Map<Id,My_Testing_Object__c> newMyTestObjMap){
        
    }
    
    public void OnAfterUpdate(My_Testing_Object__c[] oldMyTestObjs, Map<Id,My_Testing_Object__c> oldMyTestObjMap, My_Testing_Object__c[] newTestObjs, Map<Id,My_Testing_Object__c> newMyTestObjMap){
        System.debug('System.isFuture() : ');
        if(!System.isFuture()){
            getTestFuture(newMyTestObjMap.keySet());
        }        
    }
    
    @future
    static void getTestFuture(Set<Id> newTestObjIds){
        System.debug('getTestFuture : ');
        List<My_Testing_Object__c> mtoUpdate = new List<My_Testing_Object__c>();
        for(My_Testing_Object__c mto : [SELECT Id, Test_Future__c FROM My_Testing_Object__c WHERE Id IN : newTestObjIds]){
           mto.Test_Future__c = 'test future';
            mtoUpdate.add(mto);
        }
        if(mtoUpdate.size() > 0){
            update mtoUpdate;
        }
    }
}