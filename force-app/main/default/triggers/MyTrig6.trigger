trigger MyTrig6 on Student__c (before insert , before update , before delete ) {
    datetime dt = system.now();
    if( trigger.isinsert==true || trigger.isupdate==true){
        list<student__c> obj = new list <student__c>();
        obj = trigger.new;
        for(student__c er : obj){
            if(dt.format('EEEE') == 'wednesday'){
                er.sname__c.addError(' sorry we cannot add new records on wednesday ');
            }
        }
    }
    else
        if(trigger.isdelete==true){
            list<student__c> obj = new list <student__c>();
            obj = trigger.old;
            for(student__c er : obj){
                if(dt.format('EEEE')=='wednesday'){
                    er.addError(' sorry we cannot delete the record on wednesday ');
                }
            }
        }

}