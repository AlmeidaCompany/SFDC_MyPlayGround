public class CampingListController {
    
 @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        System.debug('getItems Entry: ');
        // Check to make sure all fields are accessible to this user
        /*
         * String[] fieldsToCheck = new String[] {
            'Id', 'Name', 'Quantity__c', 'Price__c', 'Packed__c' 
            
        };
        
        Map<String,Schema.SObjectField> fieldDescribeTokens = Schema.SObjectType.Expense__c.fields.getMap();
        
       for(String field : fieldsToCheck) {
            if( ! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
                return null;
            }
        }
		*/
    
        // OK, they're cool, let 'em through
        return [SELECT Id, Name, Quantity__c, Price__c, Packed__c
                FROM Camping_Item__c];
    }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item) {
        System.debug('saveItem Entry: ');
        // Perform isUpdatable() checking first, then
        upsert item;
        return item;
    }
}