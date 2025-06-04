public class DMLHelper 
{
    public static void Updaterecords(string characters)
    {
        if(characters!= null && characters !='')
            characters +='%';
        list <patient__c> listpat = [select id , Name ,Address__c from patient__c where Name like :'%'+characters];
        for (patient__c pat : listpat){
            pat.Address__c = 'Sample Address is database';
            pat.CareTakerContact__c = '7080579872';
        }
        update listpat;
    }
    
    public static void Undeleterecords(string characters)
    {
        if(characters!= null && characters !='')
            characters +='%';
        list <patient__c > listpat = [select id , Name from patient__c where Name like : characters ALL ROWS];
        if (!listpat.isEmpty())
            undelete listpat;
    }
        
    public static void Deleterecords( string characters)
    {
        if(characters != null && characters!='')
         characters +='%';
        list <patient__c> listpat = [select id , Name from patient__c where name like : characters];
        if (!listpat.isEmpty())
            delete listpat;
    }
    
    public static void Insertrecords()
    {
        list<patient__c> listpat = new list<patient__c>();
        for( integer counter=1 ; counter<=50 ; counter++)
        {
            patient__c pat = new patient__c();
            pat.Name = 'New Sample patient '+counter ;
            pat.Age__c = 70 ;
            pat.Care_Taker__c = 'Test'+counter ;
            pat.Attending_Doctor__c ='a025j00000mXj6uAAC';
            pat.Contact_Number__c = '7785403219';
            pat.Disease_OR_Problem__c = ' test identification trauma';
             listpat.add(pat);
        }
        if(!listpat.isEmpty())
            insert listpat;
    }
    public static void insertingrec()
    {
      Contact con = new Contact ();
        con.Phone = '7788994455';
        con.AssistantName = 'santrasing';
        con.FirstName = 'bantasing';
        con.LastName ='antrasing';
        insert con;
    }
}