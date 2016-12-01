public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfRecords, String lastNameStr){
    	List<Contact> randomContacts = new List<Contact>();
        for(Integer i = 0; i < numberOfRecords; i++){
            Contact c = new Contact(FirstName = 'Test '+ i);
            randomContacts.add(c);
        }
        return randomContacts;
    }
}