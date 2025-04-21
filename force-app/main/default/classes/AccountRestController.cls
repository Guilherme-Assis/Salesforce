/*
                                **** ATENÇÃO AS BOAS PRATICAS!!! ********
                                
1 - Definir um mapeamento de URL explícito para o recurso REST usando a anotação @RestResource.
2 - Usar verbos HTTP adequados para as ações REST apropriadas, como GET, POST, PUT e DELETE.
3 - Usar parâmetros de solicitação em vez de dados de solicitação no corpo da mensagem para solicitações POST e PUT.
4 - Fazer a validação adequada de dados e gerenciar exceções em todas as operações REST.
5 - Usar o padrão de projeto Singleton para instâncias de classe de recursos REST, garantindo que apenas uma instância seja criada e reutilizada por todas as solicitações REST.
6 - Usar o objeto RestContext para acessar informações de solicitação, como cabeçalhos e parâmetros.
7 - Usar a cláusula LIMIT para evitar a busca de grandes conjuntos de dados e evitar limites de consulta SOQL.
8 - Utilizar declarações global para permitir que a classe seja acessada por todas as fontes.
*/

@RestResource(urlMapping='/accounts/*')
global with sharing class AccountRestController {

    @HttpGet
    global static Account getAccountById() {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId LIMIT 1];
        return acc;
    }

    @HttpPost
    global static String createAccount(String name, String phone, String website) {
        Account acc = new Account();
        acc.Name = name;
        acc.Phone = phone;
        acc.Website = website;
        insert acc;
        return 'Account created with id: ' + acc.Id;
    }

    @HttpPut
    global static String updateAccount() {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Name = req.params.get('name');
        acc.Phone = req.params.get('phone');
        acc.Website = req.params.get('website');
        update acc;
        return 'Account updated with id: ' + acc.Id;
    }

    @HttpDelete
    global static String deleteAccount() {
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
        delete acc;
        return 'Account deleted with id: ' + acc.Id;
    }
}