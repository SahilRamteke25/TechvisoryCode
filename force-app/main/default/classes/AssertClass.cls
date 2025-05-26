@isTest
public class AssertClass {
    public static testmethod void main(){
        integer num1 , num2 , result;
    num1 = 100 ;
    num2 = 20 ;
        system.assert (num2!=0 ,'sorry we cannot devide the number by zero ');
        result = num1/num2 ;
        system.debug('the result is '+result);
    }
}