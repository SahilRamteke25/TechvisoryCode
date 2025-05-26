trigger MyTrig5 on Course__c (before insert , before update , before delete) {
    if(trigger.isInsert== true || trigger.isupdate== true){
        list<course__c> obj = new list<course__c>();
        obj = trigger.new;
        for(course__c er : obj){
            if(er.fees__c <  500){
                er.fees__c.addError(' ye combine wala trigger5  hai 500 se niche k nhi lete apn ');
            }
            
        }
    }
    else
        if(trigger.isdelete== true ){
            list<course__c> obj1 = new list<course__c>();
            obj1 = trigger.old;
            for(course__c err : obj1){
                if(err.fees__c > 1000){
                    err.fees__c.addError(' sorry we cannot delete the record its too costly aur ye trig5 hai 3 wala ');
                    
                }
            }
        }

}