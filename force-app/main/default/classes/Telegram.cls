@RestResource(urlMapping='/Telegram/*')

global with sharing class Telegram {

    @HttpPost
    global static void sendMessage(String message) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.telegram.org/bot2069354032:AAFjjYniuz1aasYNo0DUw2NMgpuTFA7yTp8/sendMessage');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"chat_id": "2011552626", "text": "' + message + '", "disable_notification": true}');
        HttpResponse response = http.send(request);
    }

    @HttpGet
    global static void getMessage() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.telegram.org/bot2069354032:AAFjjYniuz1aasYNo0DUw2NMgpuTFA7yTp8/getUpdates');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        TelegramVO VO = (TelegramVO) System.JSON.deserialize(response.getBody(), TelegramVO.class);
        List<Contact> lContact = [SELECT Id, Name, Phone, Email FROM Contact where name = :VO.result[VO.result.size() - 1].message.text];
        sendMessage('Nome: ' + lContact[0].Name);
        sendMessage('Telefone: ' + lContact[0].Phone);
        sendMessage('Email: ' + lContact[0].Email);
    }


}