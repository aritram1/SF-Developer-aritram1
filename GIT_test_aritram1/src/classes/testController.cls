public class testController{
    public PageReference Something() {
        return null;
    }
    
    Contact[] c;
    Campaign camp = new Campaign();
    
    public Contact[] getSearch(){
        c = [select id,ownerId,name,email,HasOptedOutOfEmail from Contact where email != ''];
        return c;    
    }
    
    public Campaign getCampaign(){
        camp.Name='Test Campaign';
        return camp;    
    }
}