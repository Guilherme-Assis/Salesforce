public class StringArrayTest {
    
    public static List<String> generateStringArray (Integer n){ 
        
        List<String> stringArray = new List<String> ();
        
        for(integer i = 0; i < n; i++){
            stringArray.add('Test ' + i);
        }
        
        return stringArray;
    }
}