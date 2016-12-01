global class DailyLeadProcessor implements Schedulable { 

    global void execute(SchedulableContext ctx) {
        List<Lead> leadUpdate = new List<Lead>();
        for(Lead l : [SELECT Id, LeadSource FROM Lead WHERE LeadSource = '']){
            l.LeadSource = 'Dreamforce';
            leadUpdate.add(l);
        }
        update leadUpdate;        
    }    
}