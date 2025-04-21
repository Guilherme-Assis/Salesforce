public class ContactSearch {
	
    public static List<Contact> searchForContacts (String aLastName, String aPostalCode){
        List<Contact> ctSelected = [SELECT id, name FROM Contact WHERE lastName = :aLastName AND MailingPostalCode =: aPostalCode];
        return ctSelected;
    }
}