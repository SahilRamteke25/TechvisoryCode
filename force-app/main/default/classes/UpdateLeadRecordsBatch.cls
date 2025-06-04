Global class UpdateLeadRecordsBatch implements Database.batchable<SObject>
{
    global Database.Querylocator Start(Database.BatchableContext bcontext)
    {
        {
            system.debug(' I am in start method to fetch records');
            string leadRecordsQuery = 'select id , FirstName, LastName, Rating , AnnualRevenue,LeadSource,Status from Lead';
            return Database.getQuerylocator(leadRecordsQuery);
        }
        
    }
    global void Execute(Database.BatchableContext bcontext, list<SObject> recordsToProcess)
    {
        list<Lead> leadsToUpdate = new list<Lead>();
       if (! recordsToProcess.isEmpty())
       {
           for (SObject objrecord :recordsToProcess)
           {
               Lead ldRecord = (Lead) objrecord;
               ldRecord.Rating = 'Hot';
               ldRecord.AnnualRevenue = 7200000;
               ldRecord.LeadSource = 'Web';
               ldRecord.Status = 'Working - Contacted';
               ldRecord.Website = 'http/srhospitals.com';
               leadsToUpdate.Add(ldRecord);
           }
       }
           if(!leadsToUpdate.isEmpty())
               update leadsToUpdate;
        system.debug('I am in execute method to process lead records '+leadsToUpdate);
    }
    global void Finish(Database.BatchableContext bcontext)
    {
        system.debug('Batcch JobId is ....:'+bcontext.getJobId());
        //WRITE TH EMAIL CODE 
      Messaging.SingleEmailMessage email = new Messaging.SingleEmailmessage();
        string[] ToAddress = new string[]{'sunainaramteke2@gmail.com','sahild.ramteke@gmail.com'};
        email.setToAddresses(ToAddress);
        email.setReplyTo('sahildnyramteke@gmail.com');
        email.setSenderDisplayName('SR HOSPITALS');
        string emailSubject = 'Our Job is Completed ';
        email.setSubject(emailSubject);
        email.setPlainTextBody('The Program is executed and I want to inform you that fuggi ');

        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }
  
}