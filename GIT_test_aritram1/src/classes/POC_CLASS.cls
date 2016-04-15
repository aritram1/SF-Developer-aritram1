public class POC_CLASS {
 
 public POC_CLASS(ApexPages.StandardController controller) {}
 
 /*-----------------For With/Without Sharing Example---------------*/
  
 private List<Account> SearchedResult = new List<Account>();
 /*public boolean showList = FALSE;
 public boolean getshowList(){return this.showList;}
 public void setshowList(boolean b){this.showList = b;}*/
 public  List<Account> getSearchedResult(){return this.SearchedResult;}
 public  void setSearchedResult(List<Account> l){this.SearchedResult = l;}
 private String accountName;
 public void setaccountName(String accName){this.accountName = accName;}
 public String getaccountName(){return this.accountName;}
  
 public PageReference method_withSharing_SearchAccounts(){
  System.debug('I am here !');
  SearchedResult = [Select id,name,phone,type from Account where name = :accountName];
  system.debug('SearchedResult Value is : '+ SearchedResult );
  //if(SearchedResult.size()>0){showList = true;} 
  return null;
 }
 /*------------------For With/Without Sharing Example-------------*/
}