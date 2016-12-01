public class ext1 {
    public String output{get;set;}
    public Map<String, String> getTestMap(){
        Map<String, String> mapTest = new Map<String, String>{'key' => 'Value'};
        return mapTest;
    }
    public ext1(theController customController) {

  	}
    public PageReference go(){  
        
        System.debug('ext1');
        throw new MyClassException('An error message with custom handling ');
        output = 'ext1';
        return null;
    }

}