public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String lastNameStr){
    	List<List<SObject>> searchContactsAndLeads = [FIND :lastNameStr IN ALL FIELDS RETURNING Contact(LastName WHERE (FirstName =:lastNameStr OR LastName =:lastNameStr)), Lead(LastName WHERE (FirstName =:lastNameStr OR LastName =:lastNameStr))];
        return searchContactsAndLeads;
    }
}