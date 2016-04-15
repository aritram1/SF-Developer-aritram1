public class AccountInvoice
{
    public static void createAccInvoice(String AccountTo,String AccountFrom,String Role)
    { 
     Account_to_Account__c record= new Account_to_Account__c(); 
      record.Account_To__c=AccountTo;  
      record.Account_From__c=AccountFrom;  
      record.Role__c=Role;  
     // Account_to_Account__c[] accAssociation = new Account_to_Account__c[]{record};  
       
     // insert accAssociation ;  
     insert record;
    }
}