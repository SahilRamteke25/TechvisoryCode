trigger AccDltRestriction on Account (before Delete) 
{
    if (Trigger.isbefore && Trigger.isdelete)
    {
        // to store the ids which is to be deleted
        set<Id> Aaccountids = Trigger.oldMap.keyset();
        
        
    }
           
}