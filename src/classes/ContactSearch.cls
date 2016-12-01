public class ContactSearch {
    public static List<Contact> searchForContacts(String lastNameStr, String postalCodeStr){
        List<Contact> searchForContacts = [SELECT Id, Name FROM Contact WHERE (LastName =: lastNameStr AND MailingPostalCode =: postalCodeStr)];
        return searchForContacts;
    }
}