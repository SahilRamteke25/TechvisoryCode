public class QuerryHelper 
{
    public static void QuerryFinder()
    {
        list <patient__c> patient = [select id , name , Address__c , Age__c ,Attending_Doctor__c , care_taker__c from patient__c ];
        for(patient__c p : patient)
        {
            system.debug(' The patient id is '+p);
            system.debug(' The querry result is to be shone above');
        }
    }
 
    public static void RelatedQuerry()
    {
        list <patient__c > patient = [ select id , name, Address__c , age__c, contact_number__c , total_billing_amount__c ,
                                        (select id, Medicine_Amount__c,Doctor__c from pharmacy__r)
                                                              from patient__c where name ='amitabh'];
        for(patient__c p : patient)
        {
            system.debug('The related query is '+p);
        }
    }
}