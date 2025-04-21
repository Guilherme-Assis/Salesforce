public with sharing class SendMessageAtendechat {
    public static void send(String phoneNumber, String messageBody) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://chatapi.sticonsulting.net/api/messages/send');
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer 123');
        req.setHeader('Content-Type', 'application/json');

        Map<String, Object> payload = new Map<String, Object>{
            'number' => phoneNumber,
            'body' => messageBody
        };

        req.setBody(JSON.serialize(payload));

        Http http = new Http();

        try {
            HttpResponse res = http.send(req);
            System.debug('Atendechat response: ' + res.getBody());
        } catch (Exception ex) {
            System.debug('Error sending message to Atendechat: ' + ex.getMessage());
        }
    }
}