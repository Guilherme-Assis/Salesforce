public with sharing class SendMessageFromCaseCommentFlow {

    @InvocableMethod(label='Send WhatsApp Message via Atendechat')
    public static void send(List<CaseComment> comments) {
        for (CaseComment comment : comments) {
            if (comment.IsPublished == false) continue;

            Case parentCase = [SELECT Id, SuppliedPhone FROM Case WHERE Id = :comment.ParentId LIMIT 1];
            if (String.isBlank(parentCase.SuppliedPhone)) continue;

            SendMessageAtendechat.send(parentCase.SuppliedPhone, comment.CommentBody);
        }
    }
}
