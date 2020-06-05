public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numOfContacts, String nameOfContact) {

        // loop through numOfContacts
        // Create Contact name for each loop
        // Add the contact to a list
        // return the list of contacts
        
        List<Contact> contactList = new List<Contact>();

        for (Integer i = 0; i < numOfContacts; i++) {
            contactList.add( new Contact(FirstName = 'Test '+i, 
                                            LastName = nameOfContact ));
        }
        return contactList;
    }

}
