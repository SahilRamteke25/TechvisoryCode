trigger UdateOppCountDeleted on Opportunity (After Delete) 
{
    if (Trigger.isAfter && Trigger.isDelete) 
    {
    Set<Id> accountIds = new Set<Id>();
    
    // Collect Account Ids related to deleted Opportunities
    for (Opportunity opp : Trigger.old) 
    {
        accountIds.add(opp.AccountId);
    }
    
    List<Account> relatedAccountsToUpdate = new List<Account>();
    
    // Query for the related Accounts and aggregate Opportunity data
    for (AggregateResult result : [SELECT AccountId, COUNT(Id) oppCount, SUM(Amount) totalOppAmount 
                                   FROM Opportunity 
                                   WHERE AccountId IN :accountIds 
                                   GROUP BY AccountId]) 
    {
        Id accountId = (Id)result.get('AccountId');
        Integer oppCount = (Integer)result.get('oppCount');
        Decimal totalOppAmount = (Decimal)result.get('totalOppAmount');
        
        // Create an Account object with updated values
        Account acc = new Account(Id = accountId,
                                   Total_Opportunities__c = oppCount,
                                   Total_Opportunity_Amount__c = totalOppAmount);
        
        relatedAccountsToUpdate.add(acc);
        
        // Remove the Account Id from the set as it has been processed
        accountIds.remove(accountId);
    }
    
    // Handle case where no related Opportunities left for an Account
    for (Id accountId : accountIds) 
    {
        // Create an Account object with zero values
        Account acc = new Account(Id = accountId,
                                   Total_Opportunities__c = 0,
                                   Total_Opportunity_Amount__c = 0);
        relatedAccountsToUpdate.add(acc);
    }
    
    // Update related Account records
    if (!relatedAccountsToUpdate.isEmpty()) 
    {
        update relatedAccountsToUpdate;
    }
}

}