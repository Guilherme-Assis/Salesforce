public class AccountHandler {
    
    public static Account insertNewAccount (String aName){
        Account acct = new Account(Name = aName);
        Database.SaveResult sr = Database.insert(acct, false);
        
        if(sr.isSuccess()){
            return acct;    
        }else{
            for(Database.Error err : sr.getErrors()){
               system.debug(err.getStatusCode() + ': ' + err.getMessage());
            }
            return null;
        }
        
    }
}