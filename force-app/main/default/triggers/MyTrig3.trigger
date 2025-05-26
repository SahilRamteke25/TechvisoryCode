trigger MyTrig3 on Course__c (before update , before insert) {
list <course__c> obj = new list <course__c>();
    obj = trigger.new;
    for(course__c errr : obj){
        if(errr.fees__c<500){
            errr.fees__c.addError(' kya bolte ab ye error mai nhi kr sakta show 500 se nivhe k nhi lene dunga teko samja bidu ');
        }
    }
}