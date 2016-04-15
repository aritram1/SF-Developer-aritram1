public class SearchController {
    
    public void Search(){
        
    String aname,aemail,azip;
    /*aname = :ApexPages.currentPage().getParameters().get('accName');
    aemail = :ApexPages.currentPage().getParameters().get('accEmail');
    azip = :ApexPages.currentPage().getParameters().get('accZip');*/
     
        System.debug('Name ---- '     + ApexPages.currentPage().getParameters().get('accName'));
        
        /*System.debug('aemail ---- '   + :ApexPages.currentPage().getParameters().get('accEmail'));
        System.debug('azip ---- '     + :ApexPages.currentPage().getParameters().get('accZip'));*/

            
        //Account a = [select id, name, site from Account where name = :ApexPages.currentPage().getParameters().get('accName')]; 
       
        //return a;
            
    }
                     
}