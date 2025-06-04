public class BuisnessClassForArithmetic 
{
    public integer sum( integer a , integer b, integer c ,integer result)
    {
        result = a + b + c;
       return  result ;
    }
    
    public integer subtract(integer a, integer b , integer result)
    {
        result = a - b ;
        return result ;
    }
    
    public integer multiply(integer a, integer b , integer c, integer d, integer result)
    {
        result = a*b*c*d;
        return  result;
    }
    
    public decimal division(integer a , integer b, decimal result)
    {
       if(b==0)
       {
           system.debug('Dividing by zero is not possible');
       }
        result = a/b;
        return result;
    }
}