public class TriggerArchitectureMain1 {

	public static Map<ID, Opportunity> opsToUpdate = new Map<ID, Opportunity>();
	public static Map<ID, Account> accToUpdate = new Map<ID, Account>();
	public static Map<ID, Contact> conToUpdate = new Map<ID, Contact>();
	
	//public static void entry2(List<Opportunity> newList, Map<ID, Opportunity> newMap, List<Opportunity> oldList, Map<ID,Opportunity> oldMap)
	//{	
	//	TriggerArchitectureClass1.entry2(newList, newMap, oldList, oldMap);
	//	TriggerArchitectureClass2.entry2(newList, newMap, oldList, oldMap);
	//	if(opsToUpdate.size()>0){
	//		//update opsToUpdate.values();
	//		opsToUpdate.values();
	//	}
	//}

	//public static Boolean inClass1 = false;
	//public static Boolean inClass2 = false;
	
	//public static void entry3(List<Opportunity> newList, Map<ID, Opportunity> newMap, List<Opportunity> oldList, Map<ID,Opportunity> oldMap)
	//{	
		
	//	//TriggerArchitectureClass1.entry3(newList, newMap, oldList, oldMap);
	//	//TriggerArchitectureClass2.entry3(newList, newMap, oldList, oldMap);
	//	//if(!inClass1)
	//	//{
	//	//	inClass1= true;
	//	//	TriggerArchitectureClass1.entry3(newList, newMap, oldList, oldMap);
	//	//	inClass1 = false;
	//	//}
	//	//inClass2 = true;
	//	//TriggerArchitectureClass2.entry3(newList, newMap, oldList, oldMap);
	//	//inClass2 = false;
	//	if(!inClass1){
	//		//System.debug('entry3 Class1');
	//		inClass1= true;
	//		TriggerArchitectureClass1.entry3(newList, newMap, oldList, oldMap);
	//	}
	//	if(!inClass2){
	//		//System.debug('entry3 Class2');
	//		inClass2= true;
	//		TriggerArchitectureClass2.entry3(newList, newMap, oldList, oldMap);
	//	}
	//	if(opsToUpdate.size()>0){
	//		//update opsToUpdate.values();
	//		opsToUpdate.values();
	//	} 
	//}


	public interface ITriggerEntry
	{
		void mainEntry(String triggerObject, Boolean isBefore, Boolean isDelete, Boolean isAfter, Boolean isInsert, Boolean isUpdate, Boolean isExecuting, List<SObject> newList, Map<ID, SObject> newMap, List<SObject> oldList, Map<ID,SObject> oldMap);
		
		void inProgressEntry(String triggerObject, Boolean isBefore, Boolean isDelete, Boolean isAfter, Boolean isInsert, Boolean isUpdate, Boolean isExecuting, List<SObject> newList, Map<ID, SObject> newMap, List<SObject> oldList, Map<ID,SObject> oldMap);
	}

	public static ITriggerEntry activeFunction = null;

	public static void entry4(String triggerObject, Boolean isBefore, Boolean isDelete, Boolean isAfter, Boolean isInsert, Boolean isUpdate, Boolean isExecuting, List<SObject> newList, Map<ID, SObject> newMap, List<SObject> oldList, Map<ID,SObject> oldMap)
	{	
		System.debug('TriggerArchitectureMain1 : entry4 : ' + activeFunction);
		if(activeFunction != null) 
		{
			System.debug('Check 1 : ');
			activeFunction.inProgressEntry(triggerObject, isBefore, isDelete, isAfter, isInsert, isUpdate, isExecuting, newList, newMap, oldList, oldMap);
			return;
		}
		
		if(triggerObject == 'Opportunity' && isAfter && isUpdate){
			System.debug('Check 2 : ');
			activeFunction = new TriggerArchitectureClass1();
			activeFunction.mainEntry(triggerObject, isBefore, isDelete, isAfter, isInsert, isUpdate, isExecuting, newList, newMap, oldList, oldMap);

			activeFunction = new TriggerArchitectureClass2();
			activeFunction.mainEntry(triggerObject, isBefore, isDelete, isAfter, isInsert, isUpdate, isExecuting, newList, newMap, oldList, oldMap);

			if(opstoupdate.size()>0){
				update opsToUpdate.values();
				//opsToUpdate.values();
			}
			if(accToUpdate.size()>0){
				
				update accToUpdate.values();
				//opsToUpdate.values();
			}
			if(conToUpdate.size()>0){
				update conToUpdate.values();
				//opsToUpdate.values();
			}
			activeFunction = null;
		}
	}



}