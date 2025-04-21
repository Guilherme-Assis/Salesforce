/**
 * @description       : 
 * @author            : Guilherme Assis
 * @group             : 
 * @last modified on  : 10-14-2021
 * @last modified by  : Guilherme Assis
**/
@RestResource(urlMapping='/Account/*')

global with sharing class AccountAPI {

    @HttpPost
    global static String getAccount() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String body = JSON.serialize(req.requestBody.toString());
        return 'SUCESSO';
    }
}