@isTest
public class Employee {
public static testmethod void main(){
decimal  x ,rate , tenure , simpleIntrest ;
x = 200000.2;
rate = 12.5 ;
tenure = 2 ;


simpleIntrest = ( x * rate * tenure ) /100 ;

/*Total_Amount_Paid = simple_Intrest + principal ;*/

system.debug(' the simple intrest for ' + x  +' amount' + ' is' +simpleIntrest );

/*system.debug(' the total amount paid is ' +Total_Ampunt_Paid ); */

}
}