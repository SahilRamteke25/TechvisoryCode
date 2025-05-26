trigger MyTrig7 on Employee__c (before insert , before update , before delete) {
    string hour = string.valueOf(system.now().hour());
    if(trigger.isinsert==true || trigger.isupdate==true){
        list<employee__c> obj = new list <employee__c>();
        obj = trigger.new;
        for(employee__c er : obj){
            if(hour >= '13' && hour < '17'){
                er.salary__c.addError(' sorry we can not insert record between 1 to 3 pm due to lunch break ');
                
            }
        }
    }
    else
        if(trigger.isdelete==true){
            list<employee__c> objj = new list<employee__c>();
            objj = trigger.old;
            for(employee__c errr : objj){
                if(hour>='13 ' && hour < '17'){
                    errr.addError('sorry we can not delete record between 1 to 3 pm due to lunch break');
                }
            }
        }
    

}