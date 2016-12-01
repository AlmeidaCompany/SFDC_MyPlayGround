public class ext3 {
    public String output{get;set;}
    public ext3(theController customController) {

  	}
	
    public PageReference go(){
        System.debug('ext3');
         output = 'ext3';
        return null;
    }
}