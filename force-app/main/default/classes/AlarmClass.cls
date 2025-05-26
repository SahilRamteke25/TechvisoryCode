public class AlarmClass implements schedulable {
    public void execute (schedulablecontext sc ){
        employee__c obj = new employee__c();
        obj.Ename__c = 'Rajiv gandhi';
        obj.Deptno__c = 20;
        obj.Job__c = 'developer';
        obj.Salary__c = 50000;
        insert obj ;
        
        
    }
}