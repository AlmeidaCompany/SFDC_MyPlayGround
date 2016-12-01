public interface TriggerEventsHandler {

    void AfterUpdate(Map<Id, SObject> oldMap, Map<Id, SObject> newMap);
}