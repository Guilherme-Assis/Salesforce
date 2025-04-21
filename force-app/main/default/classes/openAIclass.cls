public with sharing class openAIclass {
    @AuraEnabled
    public static string textcompletionCeck(string texttoCheck){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.openai.com/v1/completions');
        request.setMethod('POST');
        request.setHeader('Authorization', 'Bearer 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');
        request.setHeader('OpenAI-Organization', 'org-HRp36KGU9iP2IeUUzw0MyQvi');
        request.setHeader('Content-Type','application/json');
        string requestBody = '{"model":"text-davinci-003","prompt":"'+texttoCheck+'","max_tokens":4000,"temperature":0}';
        request.setBody(requestBody);
        HttpResponse response = http.send(request);
        
        openaiVO responseRetrived = openaiVO.parse(string.valueof(response.getBody()));
        //system.debug('response check --> '+responseRetrived.choices[0].text);
        
        //return string.valueof(response.getBody());
        //system.debug(response.getBody());
        //return response.getBody();
        return responseRetrived.choices[0].text;
    }
}