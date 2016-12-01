public with sharing class GoalTracker 
{
	private static final String SACCOUNT = 'Account';
	private static final String SCONTACT = 'Contact';
	private static final String SLEAD = 'Lead';
	private static final String SOPPORTUNITY = 'Opportunity';
	
	public static void goalTracker(List<SObject> sObjects)
	{
		Set<Id> goalParticipantIds = new Set<Id>();
		Set<Id> goalIds = new Set<Id>();
		Map<String, Goal_Participant__c> userGoalParticipantMap = new Map<String, Goal_Participant__c>();
		String objType = getSObjectType(sObjects[0]);
		List<Goal_Participant__c> goalParticipants = getGoalParticipants(objType, SObjects, goalParticipantIds, userGoalParticipantMap);

		if(goalParticipants.size() > 0)
		{
			List<Goal__c> goals = getGoals(goalParticipants, goalIds);
			Map<String, Goal_Qualifier__c> previouslyQualified = getPreviousQualified(goalIds, goalParticipantIds);
			List<Goal_Qualifier__c> goalQualifiers = new List<Goal_Qualifier__c>();
			evaluateGoals(objType, sObjects, goals, previouslyQualified, userGoalParticipantMap, goalQualifiers);
			if(goalQualifiers.size() > 0)
			{
				insert goalQualifiers;
			}			
		} 
	}

	private static String getSObjectType(SObject so)
	{
		String retVal = '';
		if(so instanceOf Account)
		{
			retVal = SACCOUNT;
		}
		else if(so instanceOf Contact)
		{
			retVal = SCONTACT;
		}
		else if(so instanceOf Lead)
		{
			retVal = SLEAD;
		}
		else if(so instanceOf Opportunity)
		{
			retVal = SOPPORTUNITY;
		}
		return retVal;
	}

	private static List<Goal_Participant__c> getGoalParticipants(String objType, List<SObject> sObjects, 
		Set<Id> goalParticipantIds, Map<String, Goal_Participant__c> userGoalParticipantMap)
	{
		List<Id> ownerIds = new List<Id>();
		for(SObject so : sObjects)
		{
			ownerIds.add((Id) so.get('OwnerId'));			
		}
		List<Goal_Participant__c> goalParticipants = [SELECT Id, Goal__c, User__c, Goal__r.Id FROM Goal_Participant__c 
			WHERE Goal__r.Object__c = : objType AND User__c IN : ownerIds];

		for(Goal_Participant__c g : goalParticipants)
		{
			goalParticipantIds.add(g.Id);
			userGoalParticipantMap.put((g.User__c + '' + g.Goal__r.Id).toLowerCase(), g);
		}
		return goalParticipants;
	}

	private static List<Goal__c> getGoals(List<Goal_Participant__c> goalParticipants, Set<Id> goalIds)
	{
		for(Goal_Participant__c gp : goalParticipants)
		{
			goalIds.add(gp.Goal__r.Id);
		}
		return [SELECT Id, Object__c, FieldName__c, FieldValue__c FROM Goal__c WHERE Id IN : goalIds];
	}

	private static Map<String, Goal_Qualifier__c> getPreviousQualified(Set<Id> goalIds, Set<Id> goalParticipantIds)
	{
		Map<String, Goal_Qualifier__c> retVal = new Map<String, Goal_Qualifier__c>();
		List<Goal_Qualifier__c> tmpList = [SELECT Id, Goal_Participant__c, Account__c, Contact__c, Lead__c, Opportunity__c, 
		Goal_Participant__r.Goal__c, Goal_Participant__r.User__c FROM Goal_Qualifier__c WHERE Goal_Participant__r.Goal__c IN : goalIds AND Goal_Participant__c IN : goalParticipantIds];
		for(Goal_Qualifier__c g : tmpList)
		{
			String qObject = '';
			if(g.Account__c != null)
			{
				qObject = g.Account__c;
			}
			else if(g.Contact__c != null)

			{
				qObject = g.Contact__c;
			}
			else if(g.Lead__c != null)
			{
				qObject = g.Lead__c;
			}
			else if(g.Opportunity__c != null)
			{
				qObject = g.Opportunity__c;
			}
			retVal.put((g.Goal_Participant__r.Goal__c + '' + g.Goal_Participant__r.User__c + qObject).toLowerCase(), g);
		}
		return retVal;
	}

	private static void evaluateGoals(String objType, List<SObject> sObjects, List<Goal__c> goals, Map<String, Goal_Qualifier__c> previouslyQualified,
		Map<String, Goal_Participant__c> userGoalParticipantMap, List<Goal_Qualifier__c> goalQualifiers)
	{
		for(Goal__c g : goals)
		{
			for(SObject s : sObjects)
			{
				if((String) s.get(g.FieldName__c) == g.FieldValue__c &&
					!previouslyQualified.containsKey((g.Id + '' + (String) s.get('OwnerId') + s.Id).toLowerCase()) &&
					userGoalParticipantMap.containsKey(((String) s.get('OwnerId') + g.Id).toLowerCase()))
				{
					Goal_Qualifier__c tmp = new Goal_Qualifier__c();
					tmp.Goal_Participant__c = userGoalParticipantMap.get(((String) s.get('OwnerId') + g.Id).toLowerCase()).Id;
					if(objType == SACCOUNT)
					{
						tmp.Account__c = s.Id;
					}
					else if(objType == SCONTACT)
					{
						tmp.Contact__c = s.Id;
					}
					else if(objType == SLEAD)
					{
						tmp.Lead__c = s.Id;
					}
					else if(objType == SOPPORTUNITY)
					{
						tmp.Opportunity__c = s.Id;
					}
					goalQualifiers.add(tmp);
				}
			}
		}
	}
}