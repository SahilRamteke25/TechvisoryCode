trigger accountTrigger on Account (before insert , before update) {
    list<account> acclist = new list<account>();
            system.debug('after empty list' +acclist);
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate)){
        if(!trigger.new.isEmpty()){
    for(account acc : trigger.new){
        system.debug('inside loop' +trigger.new);
        if(acc.BillingStreet != null){
                    system.debug('inside if' +acc.BillingStreet);
        acc.ShippingStreet  = acc.BillingStreet;
            acclist.add(acc);
                      system.debug('after added list' +acclist);  
    }
    }
        }
    }
}