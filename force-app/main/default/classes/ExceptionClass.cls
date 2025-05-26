@isTest
public class ExceptionClass {
    public static testmethod void main(){
        integer num1 , num2 , result ;
        try{
            result = num2 + num2 ;
        }
        catch(exception e ){
            system.debug('sorry we can not add nulls');
        }
  //  num1 = 0 ;
  //      num2 = 0;
    //     result = num1 + num2;
        system.debug('the sum is ' +result);
    
    }
    
}