public class ext2 {
    public String output{get;set;}
    public ext2(theController customController) {

  	}
    public PageReference go(){
        System.debug('ext2');
         output = 'ext2';
        return null;
    }

}