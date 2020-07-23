public class AddPrimaryContact Implements Queueable {
    private Contact primaryContact;
    private String stateContact;

    public AddPrimaryContact( Contact contactObjParam, String stateStringParam) {
        this.primaryContact = contactObjParam;
        this.stateContact = stateStringParam;
    }  

    public void execute(QueueableContext context) {
        List<Account> accountsList = [SELECT Id, Name FROM Account 
                                        WHERE BillingState = :stateContact 
                                        LIMIT 200];

        for (Account accnt : AccountsList) {
            primaryContact.clone();

            insert accnt;
        }
    }
    AddPrimaryContact primaryContactJob = new AddPrimaryContact(primaryContact, stateContact);
    Id jobID = System.enqueueJob(primaryContactJob);
    AsyncApexJob job = [SELECT Id, Status, NumberOfErrors 
                            FROM AsyncApexJob WHERE Id = :jobID];
                            
}

