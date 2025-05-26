trigger Testtrigger2 on Account (after insert , after update ) {
    if( trigger.isafter && (trigger.isinsert || trigger.isupdate)){
    list<contact> obj = new list<contact>();
    
    for( account acc : trigger.new){
    contact con = new contact();
        con.AccountId = acc.Id;
     con.Fax = acc.fax ;
        obj.add(con);
    }
    
}     
}