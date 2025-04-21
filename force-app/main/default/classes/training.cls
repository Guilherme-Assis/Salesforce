public with sharing class training  {
    @auraenabled
    public static list <Contact> getContact(String name){
        
    String searchContact;     
    list <Contact> contact = [select name, phone, email, description from contact where name like :'%'+name+'%'];
    system.debug('Contato = ' + contact);
    return contact;
    }
}