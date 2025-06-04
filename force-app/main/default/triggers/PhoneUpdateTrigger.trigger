trigger PhoneUpdateTrigger on Contact (after insert , after update) 
{
    if(trigger.isafter && trigger.isinsert)
    {
    list <Account> obj = new list <Account>();
    for (contact c : trigger.new)
    {
        account a =[Select id, name, phone from account where id =: c.AccountId ];
        a.phone = c.Phone ;
        obj.add(a);
    }
       update obj ;  
}
    if(trigger.isafter && trigger.isupdate)
    {
        set <Id> AccountIds = new set<Id>();
        for(Contact con : trigger.new)
        {
            AccountIds.add(con.AccountId);
        }
        list<Account> AccountsToUpdate = [select Id , Name , Fax from Account where Id IN :AccountIds];
        Map<Id,Account> AccountIdToAccountMap = new Map<Id,Account>();
        for(Account Acc :AccountsToUpdate)
        {
            AccountIdToAccountMap.put(Acc.Id, Acc);
        }
        
        for(Contact con :trigger.new)
        {
            Account RelatedAccount = AccountIdToAccountMap.get(con.AccountId);
            if(RelatedAccount != null)
            {
                RelatedAccount.Fax = con.Email;
            }
        }
        try 
        {
             update AccountsToUpdate; 
        }
        catch (Exception e)
        {
            system.debug('The Field Value is not available or not able to update'+e.getMessage());
        }
    }
    
}