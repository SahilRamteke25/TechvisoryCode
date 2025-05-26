@isTest
public class MethodOverloadingClassTest {
    public static testmethod void main(){
     integer rest1 , rest2 , rest3 ;
        MethodOverloadingClass obj = new MethodOverloadingClass();
        obj.setValues(10 , 100);
        rest1 = obj.addition();
        system.debug(' the addition of number is ' +rest1);
                            
        obj.setValues(100,50,10);
        rest2 = obj.substraction();
        system.debug(' the substraction of number is ' +rest2);
        
        obj.setValues(10,20,30,40);
        rest3 = obj.multiplication();
        system.debug(' the multiplication of number is ' +rest3);
        
        
        
    }

}