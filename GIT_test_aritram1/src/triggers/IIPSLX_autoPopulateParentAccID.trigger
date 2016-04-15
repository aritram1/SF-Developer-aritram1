trigger IIPSLX_autoPopulateParentAccID on Account_Client_Identification__c(before insert,before update){
    
     List<String> lid= new List<String>();
     Account_Client_Identification__c[] con = Trigger.new;
     Account[] a;
     Map<String,ID> AccountMap = new Map<String,ID>();
     
     for(Account_Client_Identification__c c: Trigger.new)
     {
         if(c.IIP_SLX_Parent_Acc_ID__c != null)
           lid.add(c.IIP_SLX_Parent_Acc_ID__c);
     }
          
     if(lid.size()>0)
     {
       try{
               a = [Select id,IIP_SLX_Account_ID__c from Account where IIP_SLX_Account_ID__c in :lid ];
               //System.debug(a);
           }
       catch(Exception e){System.debug(e);}         
     }
     
     if(a != null){
         for(Account acc :a){
             AccountMap.put(acc.IIP_SLX_Account_ID__c,acc.id);
         }
     }
     System.debug('AccountMap.size() -- ' + AccountMap.size());   
     
     for(Integer i = 0;i<lid.size();i++)
     {
          if(con[i].IIP_SLX_Parent_Acc_ID__c != null)
             con[i].Account__c=AccountMap.get(con[i].IIP_SLX_Parent_Acc_ID__c);
     }
}