// Buisness class
public class BankAccountClass{
 // Data members  
Integer ac_no , ac_bal ;
    string ach_name;
    Static integer count = 0; // static variable 
// member methods
//1. create
    public BankAccountClass(){
        system.debug(' I am in Deafault constructor');
        ac_no = 0 ;  
        ac_bal = 0 ;
        ach_name = 'no name';
        count++ ;
        }
    // 2 input
    public void setValues( integer no, string name , integer bal){
   ac_no = no;
    ach_name = name ;
    ac_bal = bal ;
}
public static void getCount(){
    system.debug(' The number of customers' + count);   
}
    // 3 process 
    public void deposit(integer amt){
        ac_bal = ac_bal + amt ;
    }
    public void withdraw(integer amt){
        ac_bal = ac_bal - amt ;
        
    }
// 4 output
    public void balance(){
   system.debug(' The account balance is ' + ac_bal);
    }
    public void getValues(){
        system.debug(' The account number is ' + ac_no);
        system.debug(' The account holder name is ' + ach_name );
        system.debug(' The account balance is ' + ac_bal);
        
    }
}