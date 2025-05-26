// buisness class 
public class DisplayTwoNumbers{
  // Data members 
  integer num1 , num2 , z  ;
     // member method 
    public DisplayTwoNumbers(){
        num1 = 0 ;
        num2 = 0 ;
    }
    public void input( integer num1 , integer num2){
       this.num1 = num1 ;
        this.num2 = num2; 
    } 
    public void process(){
        z = num1 + num2 ;
    }
    public void output(){
        system.debug(' The sum of numbers is ' + z);
      
        
    }
}