public with sharing class Second_component_datatable {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(Integer limitSize, Integer offsetSize) {
        // Set default values if null
        Integer limitVal = limitSize != null ? limitSize : 10;
        Integer offsetVal = offsetSize != null ? offsetSize : 0;

        // Return paginated Account list
        return [
            SELECT Id, Name, Industry, Phone, AnnualRevenue, Website 
            FROM Account 
            ORDER BY Name 
            LIMIT :limitVal OFFSET :offsetVal
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Integer getTotalAccountCount() {
        return [SELECT COUNT() FROM Account];
    }
    
    @AuraEnabled
    public static void deleteAccounts(List<Id> accountIds) {
        if(accountIds != null && !accountIds.isEmpty()) {
            delete [SELECT Id FROM Account WHERE Id IN :accountIds];
        }
    }
}