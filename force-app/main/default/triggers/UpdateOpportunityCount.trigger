// trigger on opportunity obj to count the no. of opportunities related to the account and display this on Account Total opp field
// and calculation the sum of amount of opportunity and display it in Account amount field
trigger UpdateOpportunityCount on Opportunity (After insert, After update, After undelete ) 
{
    if(Trigger.isAfter&&(Trigger.isinsert || Trigger.isUpdate || Trigger.isUndelete))
    {
    // create  store for new ids which is related to account
    set <Id> accountids = new set <Id>();
    // itterate the ids from opportunity 
    
    for (Opportunity opp : trigger.new)
    {
        // Adding the ids to the id store 
        accountids.add(opp.AccountId);
    }
    // AggregateResult is a funtion to use Aggregate methods in query like sum, count, min, max 
    // using this we are fetching or calculating the no. of opp and total opp amount
    
    list <Account> AccountsToUpdate = new list<Account>();
    // 1. counting the opportunities related to account count(Id)
    // 2. calculation the total amount of opp amount Sum(Amount)
    for(AggregateResult result : [select AccountId, Count(Id) oppcount, Sum(Amount) totaloppamount  FROM Opportunity 
                                  WHERE AccountId IN: accountids GROUP BY AccountId])
    {
        //creating an instance for account object to link with opp and assign the field values.
        Account acc = new Account(Id =(Id)result.get('AccountId'), Total_Opportunities__c =(decimal)result.get('oppcount'), 
                                  Total_Opportunity_Amount__c =(decimal)result.get('totaloppamount'));
        AccountsToUpdate.add(acc);
    }
    update AccountsToUpdate;
    }
    
}
// creating new contextvariable check to trigger the after delete event 
  /*  if(Trigger.isafter && Trigger.isDelete)
    {
        set <Id> accids = new set <Id>();
        {
             for(Opportunity opp : Trigger.old)
             {
                 accids.add(opp.AccountId);
             }
            list <Account> relatedacc = new list <Account>();
            for(AggregateResult result : [select AccountId, Count(Id) oppcount, Sum(Amount) totaloppamount  FROM Opportunity 
                                  WHERE AccountId IN: accids GROUP BY AccountId])
            {
                 Account acc = new Account(Id =(Id)result.get('AccountId'), Total_Opportunities__c =(integer)result.get('oppcount'), 
                                  Total_Opportunity_Amount__c =(integer)result.get('totaloppamount'));
        relatedacc.add(acc);
            }
            update relatedacc;
           
        }
       
    }
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
        }
        
        // Update related Account records
        if (!relatedAccountsToUpdate.isEmpty()) 
        {
            update relatedAccountsToUpdate;
        }
        
      // Handle case where no related opportunities left for an account object 
        for(Id accids :accountIds)
        {
           if (!relatedAccountsToUpdateMap.containsKey(accids))
            {
                Account acc = new Account(Id =accids, 
                                         acc.Total_Opportunities__c = 0,
                                         acc.Total_Opportunity_Amount__c=0);
                    relatedAccountsToUpdate.add(acc);
            }
            
        }
         // Handle case where no related Opportunities left for an Account
    for (Id accountId : accountIds) {
        if (!relatedAccountsToUpdateMap.containsKey(accountId)) {
            // Create an Account object with zero values
            Account acc = new Account(Id = accountId,
                                       Total_Opportunities__c = 0,
                                       Total_Opportunity_Amount__c = 0);
            relatedAccountsToUpdate.add(acc);
        }
    }
    
    // Update related Account records
    if (!relatedAccountsToUpdate.isEmpty()) {
        update relatedAccountsToUpdate;
    }
    }*/