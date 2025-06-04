//when updating the phone field in account object then the related contact object phone field is also updated .
//when inserting the new Account record related contact should be created . 
trigger Account on Account (After insert, after update) 
{
   
 if(trigger.isafter && trigger.isupdate)
    {
         map<id,Account> mapacc = new map<id,Account>();
    {
        if(!trigger.new.isempty())
        {
            for (Account acc : trigger.new)
            {
                if(trigger.oldmap.get(acc.id).phone != acc.phone)
                {
                    mapacc.put(acc.id,acc);
                }
            }      
        }
    }
     list<Contact> conlist = [select id , Accountid , phone from Contact Where Accountid IN : mapacc.keyset()];
    {
        list<Contact> listtoupdate = new List <Contact>();
        if(!conlist.isempty())
        {
            for (contact con : conlist)
            {
                con.phone = mapacc.get(con.AccountId).phone;
                 listtoupdate.add(con);
            }
           update listtoupdate;
        }
    }
    
}
 
    if (trigger.isafter && trigger.isinsert)
    {
       if(!trigger.new.isempty())
       {
           list <Contact> con = new list<Contact>();
           for (Account Acc : trigger.new)
           {
               Contact newcontact = new Contact();
               newcontact.FirstName = Acc.Name;
               newcontact.LastName = 'contact';
               newcontact.Phone = Acc.Phone;
               con.add(newcontact);
           }
           insert con;
       }
    }
}