trigger Insert_Recordin_Opportunity_Relatedobj on Opportunity_to_Account_Association__c (after insert) 
{
 for(Opportunity_to_Account_Association__c OppA: Trigger.new)
 {  
  if( OppA.AccountFrom__c != null && OppA.AccountTo__c != null && OppA.Role__c != null)
  {
   AccountInvoice.createAccInvoice(OppA.AccountFrom__c,OppA.AccountTo__c,OppA.Role__c); 
   }
  }
 }