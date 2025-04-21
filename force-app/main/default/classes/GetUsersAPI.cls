/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-10-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/getUsers/*')
global with sharing class GetUsersAPI {
    @HttpPost
    global static List<User> getUsersByName(String name){
        String userName = '%' + name + '%';
        List<User> lUsers = [SELECT id, name FROM user WHERE name LIKE :userName];
        return lUsers;
    }
}