trigger MyTrig8 on Employee__c (before insert , before update) {
    for(employee__c er : trigger.new){
        er.salary__c = 60000 ;
    }
}