/**
 * Created by gassisal on 21/02/2020.
 */

public with sharing class SearchClientController {
    @AuraEnabled(cacheable=true)
    public static list<Client__c> searchClients(string aName){
        String lName = '%' + aName + '%';
        return [SELECT adress__c,complement__c,Email__c,Id,Name,number_adress__c,phone__c FROM Client__c WHERE Name LIKE :lName ORDER BY Name ASC NULLS FIRST];
    }
}