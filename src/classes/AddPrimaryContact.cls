public class AddPrimaryContact implements Queueable {
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List<Contact> contactUpdate = new List<Contact>();
        for (Account a : [SELECT Id, BillingState FROM Account WHERE BillingState = : state]) {
            Contact cloneContact = contact.clone(false, false, false, false);
            cloneContact.AccountId = a.Id;
        	contactUpdate.add(cloneContact);
			
          // perform other processing or callout
        }
        insert contactUpdate;
    }
    
}