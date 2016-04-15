public class OPLItem {

public static integer i =0;

    public OPLItem(ApexPages.StandardController controller) {
        oppid=[select id from Opportunity where Id=:System.currentPagereference().getParameters().get('id')];
        //opli=[select Opportunity.name,Quantity, UnitPrice, TotalPrice, Description,PricebookEntry.Name, IsDeleted from OpportunityLineItem where OpportunityId in :oppid];   
        opli=[select Opportunity.name,Quantity, UnitPrice, TotalPrice, Description,PricebookEntry.Name, IsDeleted from OpportunityLineItem where OpportunityId in :oppid];   
        //System.debug('oppid is --> ' + i + oppid);
        //System.debug('opli---->' + i + opli);
        
        System.debug('Count is --> ' + i);
        i++;
    }

    
        
    public List<Opportunity> oppid = new List<Opportunity>();
    public List<OpportunityLineItem> opli = new List<OpportunityLineItem>();
    ApexPages.Action saveAction = new ApexPages.Action('{!save}');         
             
                         
        public List<OpportunityLineItem> getopli () {           
         // Opportunity o = new Opportunity();
         System.debug('Before Object Construction');
         Opportunity o = new Opportunity(name ='testOpp', closeDate= Date.today(), StageName='Closed Won');
         OPLItem p = new OPLItem(new ApexPages.StandardController(new Opportunity()));
         System.debug('After Object construction');
         return opli;
        }    
        
  
                   
    public PageReference dosave() {
               
                System.debug('Within Dosave method');
                
                try
                {
                  System.debug('UPDATING--->' + opli);
                  update opli;
                  System.debug('SUCCESS --->');
                }
                catch(Exception e)
                {
                 System.debug('ERROR --->'+e);
                }
                return null;
    }
    
    public PageReference del() {
        update opli;
        System.debug('Inside DELETE');
    return null;
    }
    
    


    
}