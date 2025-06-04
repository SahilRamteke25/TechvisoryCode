trigger HospitalBillingAmount on Billing__c (After insert , after update) 
{
    if(Trigger.isafter && (Trigger.isupdate || Trigger.isinsert)) {
         Set<Id> billingIds = new Set<Id>();

   for(Billing__c billingRecord : Trigger.new) {
        billingIds.add(billingRecord.Id);
    }
 // Query Total Billing from Billing records
    List<Billing__c> billingRecords = [SELECT Id, Total_Amount__c,  Billing__c.Patient_Name__c FROM Billing__c WHERE Id IN :billingIds];

    // Update corresponding Patient records
    List<Patient__c> patientsToUpdate = new List<Patient__c>();

    for(Billing__c billingRecord : billingRecords) {
        Patient__c relatedPatient = new Patient__c(
            Id = billingRecord.Patient_Name__c, // Assuming there is a lookup field called 'Patient__c' on Billing object
            Total_Billing_Amount__c = billingRecord.Total_Amount__c
        );

        patientsToUpdate.add(relatedPatient);
    }

    // Update Patient records
    update patientsToUpdate;
}
}