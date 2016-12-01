trigger OpportunityTrigger on Opportunity ( before insert,  before update,  before delete,  after insert, after update, after delete, after undelete) {
    //OPTION1
        //Map<Id, Opportunity> objectstoupdate = new Map<Id, Opportunity>();
        //if(trigger.isAfter){
        //  TriggerArchitectureClass1.entry1(trigger.new, trigger.newMap, trigger.old, trigger.oldMap, objectsToUpdate);
        //  TriggerArchitectureClass2.entry1(trigger.new, trigger.newMap, trigger.old, trigger.oldMap, objectsToUpdate);
        //}
        

        //if(objectsToUpdate.size() > 0){
        //  //objectstoupdate.values();
        //  update objectstoupdate.values();
        //}
    //OPTION2
    //if(trigger.isBefore && trigger.isUpdate){
    //  TriggerArchitectureMain1.entry2(trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
    //}
    //OPTION 3
    //if(trigger.isBefore && trigger.isUpdate){
    //  TriggerArchitectureMain1.entry3(trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
    //}
    //OPTION 4
    TriggerArchitectureMain1.entry4('Opportunity', trigger.isBefore, trigger.isDelete, trigger.isAfter, trigger.isInsert, trigger.isUpdate, trigger.isExecuting, trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
    

}