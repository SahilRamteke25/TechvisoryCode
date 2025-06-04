Global class SoapPracticeClass 
{
    Webservice static void Insert_record()
    {
        Patient__c pat = new Patient__c();
        pat.Name ='Sanskari bahu';
        pat.Address__c = 'Dubai';
        pat.Age__c = 28;
        pat.Care_Taker__c = 'Husband';
        pat.Disease_OR_Problem__c = 'not working properly';
        pat.CareTakerContact__c = '1231234560';
        pat.Contact_Number__c = '4567896540';
       // pat.Attending_Doctor__c = 'Jatin Nankani';
        insert pat;
    }
    Webservice static void Update_record()
    {
        list<Billing__c> bill = new list<Billing__c>();
        bill = [select Hospital_charges__c,Room_Charges__c from Billing__c Where Name = 'Omprakash'];
        for(Billing__c bb : bill)
        {
            bb.Hospital_charges__c += 10000;
            bb.Room_Charges__c += 10000;
        }
        update bill;
    }

}
/*
TopLevelClassSoap.SoapPracticeClass obj = new TopLevelClassSoap.SoapPracticeClass();
obj.sessionHeader = new TopLevelClassSoap.SessionHeader_element();
obj.sessionHeader.sessionId = userinfo.getsessionId();
SoapPracticeClass.Insert_record();
SoapPracticeClass.Update_record();
*/