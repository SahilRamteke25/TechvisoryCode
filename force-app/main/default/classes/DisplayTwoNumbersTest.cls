@isTest
public class DisplayTwoNumbersTest {
    public static testmethod void main(){
        //classname objectname = new classname();
      DisplayTwoNumbers obj = new DisplayTwoNumbers(); // parametarized constructor method
      obj.input(7524,252);
        obj.process();
        obj.output();
    }
}