Global class UpdateContactsRecordsBatch implements Database.Batchable<sObject>
{ // get the query records.
    global Database.QueryLocator start (Database.BatchableContext bContext)
    {
        return Database.GetQueryLocator ('select id , AccountId , FirstName, LastName,Phone , Department , Description from Contact where Department =\'Finance\' ');
    }
    // executing the query records 
    global Void Execute(Database.BatchableContext bContext , list<Contact> RecordsToProcess)
    {
        for(Contact con : RecordsToProcess)
        {
            // Add debug statements to check the values before updating
            System.debug('Updating Contact with Id: ' + con.Id + ', Description: ' + con.Description);
            con.Description = 'Contact records description is updated via contach batch class';
             // Add another debug statement to confirm the update
            System.debug('Updated Contact with Id: ' + con.Id + ', New Description: ' + con.Description);
        }
        update RecordsToProcess;
    }
    global void finish(Database.BatchableContext bContext)
    {
        system.debug('Batch job is completed successfully...');
    }
}