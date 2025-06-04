Global class ScheduleAccountsBatch implements system.Schedulable 
{
  global void execute(system.SchedulableContext sc)
  {
      // invoke the batch class 
      UpdateContactsRecordsBatch ScheduleContact = new UpdateContactsRecordsBatch ();
      Database.executeBatch(ScheduleContact , 5);
  }
}