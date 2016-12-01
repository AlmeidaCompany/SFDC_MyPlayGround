public class agDealerCalculatorPageController {
   
    public Double buyNowDiscountValue {get;set;}
    public Double buyLaterDiscountValue {get;set;}
    public Double earlyBuyNowDiscountValue {get;set;}
    public Double earlyBuyLaterDiscountValue {get;set;}
    public String accountNameValue {get;set;}    
    private String mapComponentValue = null;    
    Map<String, Decimal> componentMap = new Map<String, Decimal>();
    
    public void setMapComponentValue(String str){
        String[] strArray = str.split(':', 2);
        componentMap.put(strArray[0], Decimal.valueOf(strArray[1]));
        Decimal temp = 0.00;
        for(Decimal d : componentMap.values()){   
            temp = temp + d;
            setSumOfProductBuyNow(temp);
        }
    }
    public String getMapComponentValue(){
        return mapComponentValue;
    }
 
    private Decimal sumOfProductBuyNow = 0.00;
    
    public void setSumOfProductBuyNow(Decimal value){       
        sumOfProductBuyNow = value;
    }
    public Decimal getSumOfProductBuyNow(){
        return sumOfProductBuyNow;
    }
    
    public void doAddition(){
    }    
}