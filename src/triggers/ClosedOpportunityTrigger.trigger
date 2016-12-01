trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> newTasksList = new List<Task>();
    for(Opportunity o : Trigger.New){
        if(o.StageName == 'Closed Won'){
           Task newTask = new Task(Subject = 'Follow Up Test Task',WhatId = o.Id);
           newTasksList.add(newTask);
        }
    }
    insert newTasksList;
}