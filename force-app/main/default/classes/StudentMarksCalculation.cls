// buisness class
public class StudentMarksCalculation {
    // data members
    integer srno , m1 , m2 , m3 , tm  ;
    string sname ;
    decimal am ;
    // member methods 
    public StudentMarksCalculation(){
        srno = 0 ;
        sname = 'no name ';
        m1 = 0;
        m2 = 0; 
        m3 = 0;
        tm = 0;
        am = 0;
        
    }
    public void setValues(integer sid , string name , integer s1 , integer s2 , integer s3 ){
        srno = sid ;
        sname = name ;
        m1 = s1 ;
        m2 = s2 ;
        m3 = s3 ;
    }
    public void totalMarks(){
        tm = m1 + m2 + m3 ;
    }
    public void avgMarks(){
        am = tm/3 ;
        
    }
    public void getValues(){
        system.debug(' The Total Marks is ' + tm);
        system.debug(' The average Marks is ' + am );
        
    }
}