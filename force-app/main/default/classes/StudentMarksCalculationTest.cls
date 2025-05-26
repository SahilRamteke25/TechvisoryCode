@isTest
public class StudentMarksCalculationTest {
    public static testmethod void main(){
        StudentMarksCalculation obj = new StudentMarksCalculation();
        obj.setValues(101 , 'sahil' , 89 , 89 , 99);
        obj.totalMarks();
        obj.avgMarks();
        obj.getValues();
    }
    
    
}