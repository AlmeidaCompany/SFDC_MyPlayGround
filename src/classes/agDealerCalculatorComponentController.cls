public class agDealerCalculatorComponentController {	
    public Boolean unitHasError{
        get{
            if(unitHasError == null){
                unitHasError = false;
            }
            return unitHasError;
        }
        set;
    }
    public Double units {
        get{
            if(units < 0){
                unitHasError = true;
            }else{
                unitHasError = false;
            }
            return units;                   
        }
        set;
    }
    public String trait  {
        get{
            if(dekalbBrandValue != '--None--' && dekalbBrandValue != null){
                trait = String.valueOf(agDealerBrands.get(dekalbBrandValue).Trait__c);
            }else{
                trait = '';                
            }            
            return trait;
        }
        set;
    }
    public Double spr {
        get{
            if(dekalbBrandValue != '--None--' && dekalbBrandValue != null){
                spr = agDealerBrands.get(dekalbBrandValue).SRP__c;
            }else{
                spr = 0;                
            }            
            return spr;
        }
        set;
    }
   public Double unitBuyNow {
        get{
            if(units != null){
                unitBuyNow = spr;
            }else{
                unitBuyNow = 0;
            }
            return unitBuyNow;
            }
        set;
    }
    public Double productBuyNow{
        get{
            if(units != null && units > 0){
                productBuyNow = units * unitBuyNow;
            }else{
                productBuyNow= 0;    
            }            
            return productBuyNow;
        }
        set;
    }    
    public String dekalbBrandValue {get;set;}
    public Map<Id,My_Testing_Object__c> agDealerBrands = new Map<Id,My_Testing_Object__c>([SELECT Id, Name, Brand__c, SRP__c, Trait__c FROM My_Testing_Object__c]);
    public List<SelectOption> dekalbBrands {
        get{
            List<SelectOption> options = new List<SelectOption>();
            Set<String> city = new Set<String>();
            options.add(new SelectOption('--None--','--None--')); 
            if(!agDealerBrands.isEmpty()){
               for (My_Testing_Object__c brandList : agDealerBrands.values()){
                   options.add(new selectOption(brandList.Id, brandList.Brand__c));             
               } 
            }
            
            return options;                  
        }
        set;
    }
    public String clothiRateValue {get;set;}
    public List<SelectOption> clothiRates {
        get{
            List<SelectOption> options = new List<SelectOption>();
            Set<String> city = new Set<String>();
            options.add(new SelectOption('--None--','--None--'));
            options.add(new SelectOption('--Other--','--Other--'));
            return options;                  
        }
        set;
    }
    
    

}