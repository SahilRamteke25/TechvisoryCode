Global class UpdateAccountsRecordsBatch implements Database.Batchable<sObject>
{
    //querry to select the records to be processed
    global Database.QueryLocator start(Database.BatchableContext bContect)
    {
        return Database.getQueryLocator('select id , Name , Description , AnnualRevenue from Account where AnnualRevenue > 100000');
    }
    //Process to each record.
    global void Execute(Database.BatchableContext bContext , list<Account> RecordsToProcess)
    {
        for(Account acc : RecordsToProcess)
        {
            acc.Description = 'New batch class is executed and this batch class is more than updated your description' ;
        }
        update RecordsToProcess;
    }
    Global void Finish(Database.BatchableContext bContext)
    {
        system.debug('Batch Job is Successfully completed...');
    }
}