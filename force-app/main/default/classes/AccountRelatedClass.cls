public class AccountRelatedClass
{
    public static void AccountRelatedContact()
    {
        Account createAccount = new Account(
            name = ' KUNAL',
            Rating = 'hot',
            Industry = 'chemical',
            AnnualRevenue = 250000          
        );
        insert createAccount;
        
        //create contact record
           contact createContact = new contact(
           Accountid =createAccount.id,
               Birthdate = Date.newinstance(2023,01,01),
               Department = 'Library',
               Languages__c = ' English',
               FirstName = 'Kunal',
               LastName = 'gajbhiye'
               );
        insert createAccount ;
    }
}