public class class_Explain_ApexMessage{

    public class_Explain_ApexMessage(ApexPages.StandardController controller) {}
    
    Account A = new Account();
    
    public Account getA(){return this.A;}
    public void setA(Account b){this.A = b;}
    
    public PageReference methodApexMessage(){
     if(a.site == null){
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Please Populate All the fields'));
      return null;
     }        
     else{
      return null;
     } 
    }
}