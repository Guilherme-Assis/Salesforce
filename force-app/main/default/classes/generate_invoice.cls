public class generate_invoice {
    @AuraEnabled
    public static Opportunity getOpportunity(String id){
        
        Opportunity opportunity = [select name, Amount, Owner.Name  from opportunity where Id =: id];
        return opportunity;
    }
    
}