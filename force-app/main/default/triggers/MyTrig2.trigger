trigger MyTrig2 on Course__c (before update) {
list<course__c> obj = new list <course__c>();
    obj = trigger.new;
    for (course__c er : obj){
        if(er.fees__c<500){
            er.fees__c.adderror(' sorry we can not update the record which is less than 500 rs fees ');
        }
    }
}