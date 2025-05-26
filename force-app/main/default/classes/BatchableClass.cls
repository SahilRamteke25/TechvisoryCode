public class BatchableClass implements database.Batchable <Employee__c>{
    public Iterable<Employee__c>start(database.Batchablecontext bc){
        return[select salary__c from Employee__c];
      
    }
    public void execute(database.Batchablecontext bc, list <Employee__c> obj){
        for(Employee__c er:obj){
            er.salary__c+=1000;
            
        }
        update obj;
    }
public void finish (database.batchablecontext bc){
messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
string[] toAddress = new string[]{'sunainaramteke2@gmail.com,sahild.ramteke@gmail.com'};

mail.setToAddresses(toAddress);
mail.setSubject('Hello baby what are you doing ');
mail.setPlainTextBody(' You are far more than my partner. you are my soulmate in every way. thats why I love you more and more babu ');
messaging.sendEmail(new Messaging.singleEmailMessage[]{mail});
}
}