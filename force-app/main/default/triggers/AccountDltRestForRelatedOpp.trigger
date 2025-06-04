// Trigger to prevent from deletion when there are more than 1 related opportunities are present or
// when the opportunity amount is more than 2000 
trigger AccountDltRestForRelatedOpp on Account (before Delete) 
{
    // iterating the Account object to fetch the records with Trigger.old 
    for(Account acc : Trigger.old)
    {
        // condition check 
        if(acc.Total_Opportunities__c>=2 || acc.Total_Opportunity_Amount__c>=2000)
        {
            // Display an error message
            acc.addError('The Accounts which has related Opportunities are not able to Delete');
            
        }
    }
}
/*
trigger PreventAccountDeletion on Account (before delete) {
    // Collect the Ids of all Accounts being deleted
    Set<Id> accountIds = new Set<Id>();
    for (Account acc : Trigger.old) {
        accountIds.add(acc.Id);
    }
    
    // Query for Opportunities related to the Accounts being deleted
    List<Opportunity> relatedOpportunities = [SELECT Id FROM Opportunity WHERE AccountId IN :accountIds];
    
    // If there are related Opportunities, add an error to prevent deletion
    if (!relatedOpportunities.isEmpty()) {
        for (Account acc : Trigger.old) {
            acc.addError('Cannot delete this Account because it has related Opportunities.');
        }
    }
}

*/