@RestResource(urlMapping='/AccountAPI/*')  // Define the URL endpoint
global with sharing class AccountRestAPI {

    @HttpGet
    global static Account getAccount() {
        // Get the Account Id from the URL
        RestRequest req = RestContext.request;
        String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);

        // Check if the Account ID is provided
        if (String.isNotBlank(accountId)) {
            // Query the Account record using the provided ID
            Account account = [SELECT Id, Name, Phone, Industry FROM Account WHERE Id = :accountId LIMIT 1];
            return account;  // Return the Account record
        } else {
            // Return an error message if no ID is provided
            RestContext.response.statusCode = 400;
            RestContext.response.responseBody = Blob.valueOf('{"error": "Account ID is required"}');
            return null;
        }
    }
}