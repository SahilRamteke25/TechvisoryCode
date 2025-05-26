@isTest
public class UpdateClass {
    public static testmethod void main(){
list<Employee__c> obj = new list<Employee__c>();
        obj = [select salary__c from Employee__c where ename__c like 'sanskaribahu'];
        for(Employee__c er : obj){
            er.salary__c -= 1000;
        }
    update obj;
    }
    

}