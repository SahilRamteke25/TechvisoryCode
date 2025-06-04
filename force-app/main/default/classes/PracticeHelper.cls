public class PracticeHelper 
{
    // write an apex class to insert some records into the account sobject using dml statements 
    // via noramal class and execute this it with the help of anonymous window .
    public static void InsertRecords()
    {
        List<Account> accountsToInsert = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Santra';
        acc.Phone = '987654210';
        acc.NumberOfEmployees = 1800;
        acc.Rating = 'Warm';
        accountsToinsert.add(acc);
        insert accountsToInsert;
    }
    
    // write an apex class to update the account object record santra and update the remaining fileds ...
    public static void UpdateRecords()
    {
        list<Account> RecordsToUpdate = new list<Account>();
        list<Account> Updatelist = [select id , Name , Phone , NumberOfEmployees ,Tradestyle,Industry From Account where Name ='Santra' ];
        for(Account Acc : Updatelist)
        {
            Acc.Phone = '1234567890';
            Acc.AnnualRevenue = 78000;
            Acc.Industry = 'Chemical';
            Acc.NumberOfEmployees = 1500 ;
            RecordsToUpdate.add(Acc);
        }
        upsert Updatelist;
    }
   
    // write a dml operation for the account object in which
    // the record date is close is deleted automatically once when the program is execute
    public static void DeletedRecords()
    {
        list <Account> DeleteAcc = [select id , Name ,NumberOfEmployees,AnnualRevenue from Account where AnnualRevenue <= 100000 ];
       Delete DeleteAcc;
    }
    
    // write a dml operation to undelete the deleted records from the accounts object.
    public static void UndeleteRecords()
    {
        list<Account> undeleterecord = [select id ,Name ,AnnualRevenue from Account where AnnualRevenue <= 100000 ALL ROWS];
        undelete undeleterecord;
    }
    

}