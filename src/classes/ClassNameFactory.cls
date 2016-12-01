public class ClassNameFactory {
	public static Map<String, Set<String>> getClassNameMap(String objName){   	     
        Set<String> customSettingFields = new Set<String>{'BeforeInsert__c', 'BeforeUpdate__c', 'BeforeDelete__c', 'AfterInsert__c', 'AfterUpdate__c', 'AfterDelete__c', 'AfterUndelete__c' };
        Set<String> classNames = new Set<String>();
        TriggerMasterControl__c tmc = TriggerMasterControl__c.getValues(objName);
        for(String csf : customSettingFields){
            if(tmc.get(csf) == true){
                Integer index = csf.indexOf('__c');
                String tmp = objName+ csf.substring(0, index)+'Handler';
                classNames.add(tmp);    
            }    
        }
        Map<String, Set<String>> classNameMap = new  Map<String, Set<String>>();
        classNameMap.put(objName, classNames);          
        return classNameMap;
    }
}