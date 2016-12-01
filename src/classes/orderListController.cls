public class orderListController {
    
    @AuraEnabled
    public static List<Order> getCaseOrders(Id caseId){
        System.debug('getOrders entry : ');
        //Id userId = UserInfo.getUserId();
    	//return null;
    	//return [SELECT Id, OrderNumber, Account.Name, Status, EffectiveDate FROM Order WHERE Case__c = : caseId LIMIT 10];
    	return [SELECT Id, OrderNumber, Account.Name, Status, EffectiveDate, Case__r.CaseNumber FROM Order WHERE Case__c = : caseId LIMIT 5];
    }

}