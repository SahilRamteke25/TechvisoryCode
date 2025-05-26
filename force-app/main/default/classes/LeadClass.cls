public class LeadClass {
    public static void createLeadwithEventandTask(){
        //create Lead 
        Lead newLead = new Lead(
            FirstName = 'Sahil',
            LastName = 'Ramteke',
            company = 'Salesforce',
            status = 'open'
        );
       insert newLead;
        
        //create Event related to Lead 
        Event newEvent = new Event(
        subject = 'Learning Salesforce',
         location ='Nagpur',
          StartDateTime = system.now(),
            EndDateTime = system.now().addHours(1),
            WhoId = newLead.Id
        );
        insert newEvent;
        
        // Create Task related to lead 
        Task newTask = new Task(
        subject = 'apex class', 
            WhoId = newLead.Id,
            ActivityDate = system.today().addDays(7),
            status = 'Not Started'
        );
        insert newTask;
    }
}