public class SOQLInjectionController {
    public String name {
        get { return name;}
        set { name = value;}
    } 
    public PageReference query() {
        String qryString = 'SELECT Id FROM Contact WHERE ' + '(IsDeleted = false and Name like \'%' + name + '%\')' + 'LIMIT 1';
        Contact queryResult = Database.query(qryString);
        return null;
    }
}