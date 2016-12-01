public class NewCaseListController {    
    public List<Case> getNewCases(){
        List<Case> caseResults = [SELECT Id, CaseNumber FROM Case WHERE Status = 'New'];
        return caseResults;
    }

}