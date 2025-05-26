@isTest
public class DeleteClass {
    public static testmethod void main(){
        list <Employee__c> obj = new list<Employee__c>();
        obj = [select id from Employee__c where ename__c like 'shembdii'];
        delete obj ;
    }
}