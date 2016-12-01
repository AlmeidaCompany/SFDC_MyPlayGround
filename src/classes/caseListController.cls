public with sharing class caseListController {
	
	@AuraEnabled
    public static List<Case> getCases(){
        Id userId = UserInfo.getUserId();
    	return [SELECT Id, CaseNumber, Account.Name, Contact.Name, Status, Subject, CreatedDate, ClosedDate, (SELECT Id FROM Orders__r) FROM Case WHERE OwnerId = : userId LIMIT 5];
    }
}