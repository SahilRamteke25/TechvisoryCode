trigger OPTtrigger on Operation_Theater__c (before insert , before update, before delete, after insert ,after update) 
{  
    if(Trigger.isbefore &&(trigger.isinsert || trigger.isupdate))
    {
        for (Operation_Theater__c opt : trigger.new)
        {
            if(opt.Name != null && opt.Name.length()<=10)
            {
                opt.Name.adderror('The field length must be greater than 10 characters ');
            }
        }
    }
    
   if(trigger.isbefore && trigger.isdelete)
   {
       for(Operation_Theater__c opt : trigger.old)
       {
           if(opt.Name.length()>=20)
           {
               opt.Name.adderror('Not able to delete because the length is more than 20');
           }
       }
   }
    // for updating a new field with respect to the data 
   
  if(trigger.isafter && (trigger.isinsert || trigger.isupdate))
   {
       for (Operation_Theater__c opt : trigger.new)
       {
           if(opt.Operation_Time_in_hrs__c <=2)
           {
               opt.Priority__c = 'LOW';
           }
       
           if(opt.Operation_Time_in_hrs__c >=3 && opt.Operation_Time_in_hrs__c<=5)
           {
               opt.Priority__c ='MEDIUM';
           } 
           
           if(opt.Operation_Time_in_hrs__c >=6)
           {
               opt.Priority__c='HIGH';
           }
       
       }
   }

}