public with sharing class ParentChildHandlerLWCThre 
{
     @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(ID accountId)
    {
        try {
            return [select Id,name,phone from contact where accountId = :accountId];   
        } 
        catch(Exception e){
            throw new AuraHandledException('exceptionText'+e.getMessage());
        }
    }
}