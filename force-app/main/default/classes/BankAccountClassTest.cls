@isTest
public class BankAccountClassTest {
    public static testmethod void main(){
        BankAccountClass cust1 = new BankAccountClass ();
        cust1.getValues();
        cust1.setValues(11100011, ' sahil ' , 100010);
        cust1.getValues();
        cust1.deposit( 10010 ) ;
        cust1.balance();  
        cust1.withdraw(4001);
        cust1.balance();  
        cust1.getValues();
        BankAccountClass.getCount();
        
        BankAccountClass cust2 = new BankAccountClass ();
        cust2.getValues();
        cust2.setValues(11105742, 'sahira' , 105710);
        cust2.getValues();
        cust2.deposit(10740);
        cust2.balance();
        cust2.withdraw(4041);
        cust2.balance();
        cust2.getValues();
        BankAccountClass.getCount();
             
        BankAccountClass cust3 = new BankAccountClass ();
        cust3.getValues();
        cust3.setValues(11011, 'sunaina' , 8750010);
        cust3.getValues();
        cust3.deposit(10014);
        cust3.balance();
        cust3.withdraw(41001);
        cust3.balance();
        cust3.getValues();
        BankAccountClass.getCount();
            
       
        BankAccountClass cust4 = new BankAccountClass ();
        cust4.setValues(111011, 'sara' , 5887894);
        cust4.getValues();
        cust4.deposit(1010);
        cust4.balance();
        cust4.withdraw(4001);
        cust4.balance();
        cust4.getValues();
        BankAccountClass.getCount();
        
        
        
    }
}