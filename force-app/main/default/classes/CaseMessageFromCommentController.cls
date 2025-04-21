public with sharing class CaseMessageFromCommentController {

    @AuraEnabled
    public static void sendLastPublicComment(Id caseId) {
        // Fetch latest public comment
        List<CaseComment> comments = [
            SELECT Id, CommentBody
            FROM CaseComment
            WHERE ParentId = :caseId AND IsPublished = TRUE
            ORDER BY CreatedDate DESC
            LIMIT 1
        ];

        if (comments.isEmpty()) {
            throw new AuraHandledException('No public comment found.');
        }

        // Get case phone number
        Case c = [
            SELECT Id, SuppliedPhone
            FROM Case
            WHERE Id = :caseId
            LIMIT 1
        ];

        if (String.isBlank(c.SuppliedPhone)) {
            throw new AuraHandledException('Phone number is missing.');
        }

        SendMessageAtendechat.send(c.SuppliedPhone, comments[0].CommentBody);
    }
}
