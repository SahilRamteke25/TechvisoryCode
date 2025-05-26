trigger MyTrig1 on Course__c (before insert) {
list<course__c> obj = new list<course__c>();
    obj = trigger.new ;
    for(course__c er : obj){
        if(er.fees__c < 500){
            er.fees__c.addError('sorry we cannot insert the record into the sobject fees is less than 500.');
            
        }
    }
}