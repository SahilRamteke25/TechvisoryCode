//write a batch class to update the address field of the patients object 

Global class UpdatingPatientsRecordsBatch implements Database.Batchable<Sobject>
{ 
 Global Database.QueryLocator Start (Database.BatchableContext bContext)
{
  system.debug('We are in start method');
  return Database.GetQueryLocator('Select Id, Name,Age__c,Address__c From Patient__c where Name like \'s%\' ');   
 
}
 Global Void Execute (Database.BatchableContext bContext , list<Patient__c> patToUpdate)
{
 for (Patient__c pat : patToUpdate)
{
    system.debug('The Address before update is '+pat.Address__c);
 pat.Address__c = 'study centre kamptee near new police station bhojnalay ';
    system.debug('The address after update is'+pat.Address__c);
}
 update patToUpdate;
}
 Global Void Finish (Database.BatchableContext bcontext)
{
 system.debug('Batch job is successfully completed');
} 
}