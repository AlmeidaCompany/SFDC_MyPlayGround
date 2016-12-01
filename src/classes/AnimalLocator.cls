public class AnimalLocator{
    
    /**public class Animal {
		public Integer id;
		public String name;
		public String eats;
		public String says;
	}**/

    public static String getAnimalNameById(Integer id){
        Http http  = new Http();
        HttpRequest req = new HttpRequest();        
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);        
        req.setMethod('GET');        
        HttpResponse res = http.send(req);
        
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
       // System.debug('Check 1 : '+ (AnimalLocator.Animal)JSON.deserialize(res.getBody(), AnimalLocator.Animal.class));
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');
        return (String)animal.get('name');
    }
}

/**public Animal animal;

	public class Animal {
		public Integer id;
		public String name;
		public String eats;
		public String says;
	}

	
	public static Animal parse(String json) {
		//Animal a = (Animal)JSON.deserialize(json, Animal.class);
        return (Animal) System.JSON.deserialize(json, Animal.class);
        //return a;
	}**/