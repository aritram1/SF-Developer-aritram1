trigger IIP_AutoPopulate_acc_acc_asssoc on Account_to_Account__c (before insert,before update){

    Account_to_Account__c[] acc2acc = Trigger.new;
    Map<String,ID> Acc2AccMap = new  Map<String,ID>();
    List<String> lFrom = new List<String>();
    List<String> lTo = new List<String>();
    
    
    for(Account_to_Account__c aa : Trigger.new){
  
        if(aa.accountFromID__c != null && aa.accountToID__c !=null){
            lFrom.add(aa.accountFromID__c);
            lTo.add(aa.accountToID__c);
        }
    }    
         
  
    Account[] aFrom = [Select id from Account where IIP_SLX_Account_ID__c in :lFrom];
    Account[] aTo   = [Select id from Account where IIP_SLX_Account_ID__c in :lTo];
    
    for(Account a : aFrom){
        Acc2AccMap.put(a.IIP_SLX_Account_ID__c,a.ID); 
    }
    

    for(Account a : aTo){
        Acc2AccMap.put(a.IIP_SLX_Account_ID__c,a.id); 
  

    }
    System.debug('List Size = ' + lFrom.size());
    System.debug('aFrom  Size = ' + aFrom.size());
    System.debug('aTo Size = ' + aTo.size());
    
    for(Integer i = 0 ;i < Trigger.new.size();i++){
  
       acc2acc[i].Account_From__c = Acc2AccMap.get(acc2acc[i].accountFromID__c);
       acc2acc[i].Account_To__c = Acc2AccMap.get(acc2acc[i].accountToID__c);
        
     }   

}