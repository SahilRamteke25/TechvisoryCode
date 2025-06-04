trigger PatientsMandatoryFields on Patient__c (before insert , before update )
{
    if ((trigger.isbefore)&&(trigger.isinsert || trigger.isupdate))
    {
        for (Patient__c pat : trigger.new)
        {
            if(pat.Age__c == null || pat.Age__c==0)
            {
                pat.Age__c.adderror('Please enter the age of the patient');
            }
            else if (pat.Disease_OR_Problem__c ==null || pat.Disease_OR_Problem__c=='')
            {
                pat.Disease_OR_Problem__c.AddError('Please describe the problem or disease of the patient ');
            }
             else if (pat.Care_Taker__c== null || pat.Care_Taker__c== '')
             {
                 pat.Care_Taker__c.AddError('Please enter the caretaker name ');
             }
            else if (pat.CareTakerContact__c== null)
            {
                pat.CareTakerContact__c.AddError('Please enter the care taker contact number ');
                
            }
        }
    }

}