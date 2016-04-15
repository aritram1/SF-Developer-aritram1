trigger MMD_autoPopulateParentAcc_ID on LOB_Account_Type_Priority__c(before insert,before update){
    
     List<String> lid= new List<String>();
     LOB_Account_Type_Priority__c[] LA = Trigger.new;
     Account[] a;
     Map<String,ID> AccountMap = new Map<String,ID>();
     
     for(LOB_Account_Type_Priority__c L: Trigger.new)
     {
         if(L.MMD_Parent_Acc_ID__c != null)
           lid.add(L.MMD_Parent_Acc_ID__c);
     }
          
     if(lid.size()>0)
     {
       try{
               a = [Select id,MMD_Account_ID__c from Account where MMD_Account_ID__c in :lid ];
               //System.debug(a);
           }
       catch(Exception e){System.debug(e);}         
     }
     
     if(a != null){
         for(Account acc :a){
             AccountMap.put(acc.MMD_Account_ID__c,acc.id);
         }
     }
     System.debug('AccountMap.size() -- ' + AccountMap.size());   
     
     for(Integer i = 0;i<lid.size();i++)
     {
          if(LA[i].MMD_Parent_Acc_ID__c != null)
             LA[i].Account__c=AccountMap.get(LA[i].MMD_Parent_Acc_ID__c);
     }
}