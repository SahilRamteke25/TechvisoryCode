trigger MyTrig11 on Course__c (before insert) {
    for(course__c er : trigger.new){
        list<course__c> obj = [select id , name from course__c where name = : er.name];
        if(obj.size()>0){
            er.name.addError('coursename already existed');
            
        }
    }   
}