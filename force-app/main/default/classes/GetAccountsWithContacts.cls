public with sharing class GetAccountsWithContacts {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsWithContacts() {
        return [
            SELECT Id, Name, Industry, Phone, AnnualRevenue, Website,
                   (SELECT Id, LastName,Phone ,	Department, Email FROM Contacts)
            FROM Account
            LIMIT 100
        ];
    }
}