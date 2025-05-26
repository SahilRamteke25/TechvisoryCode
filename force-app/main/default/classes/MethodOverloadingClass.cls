public class MethodOverloadingClass {
    integer num1 , num2 , num3 , num4 , result ;
    public MethodOverloadingClass (){
        num1 = 0 ;
        num2 = 0 ;
        num3 = 0 ;
        num4 = 0 ;
        result = 0 ;
    }
    public void setValues( integer a , integer b ){
    num1 = a ; 
    num2 = b ;
} 
    public void setValues(integer a , integer b , integer c){
        num1 = a ;
        num2 = b ;
        num3 = c ;
    }
    public void setValues(integer a , integer b , integer c , integer d ){
        num1 = a ;
        num2 = b ;
        num3 = c ;
        num4 = d ;
    }

    public integer addition(){
        result = num1 + num2 ;
        return result ;
    }
    
    public integer substraction(){
        result = num1 - num2 - num3 ;
        return result ;
    }
    public integer multiplication(){
        result = num1* num2* num3* num4 ;
        return result ;
    }
    
}