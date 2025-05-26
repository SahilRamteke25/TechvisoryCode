public with sharing class Second_component_datatable {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [
            SELECT Id, Name, Industry, Phone, AnnualRevenue, Website
            FROM Account
            ORDER BY Name
            LIMIT 20
        ];
    }
}