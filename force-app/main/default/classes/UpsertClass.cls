@isTest
public class UpsertClass {
    public static testmethod void main(){
        list<Employee__c> obj = new list<Employee__c >();
        obj = [select salary__c from employee__c where ename__c like '_____'];
        for(employee__c er : obj){
            er.salary__c +=1002 ;
        }
        employee__c obj2 = new employee__c ();
        obj2.ename__c = 'shembdii';
        obj2.job__c = 'graduate berojgar';
        obj2.salary__c = 25250;
        obj.add(obj2);
        upsert obj;
            }
}