public class Dog {
    private static Dog dogInstance = null;
    public String name{get;private set;}
    
    private Dog(){
        name = 'El perro';
    }   
   
    public static Dog getDogInstance(){
        dogInstance = new Dog();
        return dogInstance;
    }
}