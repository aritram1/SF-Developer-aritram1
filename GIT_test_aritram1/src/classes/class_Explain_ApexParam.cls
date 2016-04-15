public class class_Explain_ApexParam{

    public class_Explain_ApexParam(ApexPages.StandardController controller) {}
    public String accountRating{get;set;}
    public String parameter1{get;set;}
    public Boolean showRating = False;

    public boolean getshowRating(){return this.showrating;}
    public void setshowRating(Boolean b){this.showRating = b;}
    
    public PageReference ApexParamTest(String rating){
        
        if(rating == 'Hot'){
            accountRating = 'This is a Hot Account';
        }
        if(rating == 'Warm'){
            accountRating = 'This is a Warm Account';
        }
        if(rating == 'Cold'){
            accountRating = 'This is a Cold Account';
        }
      showRating = true;
      return null;
    }

}