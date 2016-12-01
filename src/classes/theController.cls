public class theController {    
    public String output{get;set;}
    public PageReference go(){        
        System.debug('theController');
        output = 'theController';
        return null;
    }

}