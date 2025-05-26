trigger MyTrig44 on Course__c (before delete) {
list <course__c> obj = new list <course__c>();
    obj =trigger.old;
    for(course__c er: obj){
        if(er.fees__c > 1000){
            er.fees__c.addError(' Delete nhi krnedenge inko ye apne log hai samja mac');
            
        }
    }
}