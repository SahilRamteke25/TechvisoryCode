@isTest
public class UndeleteClass {
    public static testmethod void main(){
        list<Employee__c> obj = new list<Employee__c>();
        obj = [select Id from Employee__c all rows ];
        undelete obj;
    }

}