@isTest
public class FetchClass {
    public static testmethod void main(){
        list<Employee__c> obj = new list<Employee__c>();
        obj = [select name , ename__c , salary__c , job__c from Employee__c where ename__c like 'sahil'];
        for(employee__c er : obj){
            system.debug(er);
        }
    }
}