@RestResource(urlMapping='/Twilio/*')

global with sharing class TwilioIntegration {

    @HttpPost
    global static void sendMessage() {

        Map<String, String> mapToSend = new Map<String, String>();
        mapToSend.put('To', 'whatsapp:+553491448852');
        mapToSend.put('From', 'whatsapp:+14155238886');
        mapToSend.put('Body', 'Teste Twilio');

        String body = '';
        for(String key : mapToSend.keySet()){
            body += key + '=' + EncodingUtil.urlEncode(mapToSend.get(key), 'UTF-8') + '&';
        }
        body = body.substring(0, body.length() - 1);

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Twilio');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setBody(body);
        HttpResponse response = http.send(request);
    }

    @HttpGet
    global static void getMessages(){
        Http Http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Twilio_Get_Messages');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        TwilioVO results = (TwilioVO) System.JSON.deserialize(response.getBody(), TwilioVO.class);
        system.debug(results.messages[0]);
    }

}