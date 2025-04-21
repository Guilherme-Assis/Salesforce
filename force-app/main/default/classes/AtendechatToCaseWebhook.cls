@RestResource(urlMapping='/atendechat/inbound')
global with sharing class AtendechatToCaseWebhook {

    @HttpPost
    global static void handleMessage() {
        RestRequest req = RestContext.request;
        String body = req.requestBody.toString();
        Map<String, Object> data = (Map<String, Object>) JSON.deserializeUntyped(body);

        String sessionId = (String)data.get('sessionId');
        String phone = (String)data.get('from');
        String msg = (String)data.get('message');

        List<Case> existing = [
            SELECT Id FROM Case
            WHERE Session_Id__c = :sessionId
            LIMIT 1
        ];

        if (existing.isEmpty()) {
            Case c = new Case();
            c.Subject = 'Atendimento WhatsApp';
            c.Description = msg;
            c.Origin = 'WhatsApp';
            c.Status = 'Novo';
            c.SuppliedPhone = phone;
            c.Session_Id__c = sessionId;
            insert c;
        } else {
            // opcional: criar histórico ou comentário
            CaseComment cc = new CaseComment();
            cc.ParentId = existing[0].Id;
            cc.CommentBody = msg;
            cc.IsPublished = true;
            insert cc;
        }
    }
}
