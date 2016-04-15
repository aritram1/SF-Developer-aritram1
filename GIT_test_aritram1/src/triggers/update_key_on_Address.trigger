trigger update_key_on_Address on Address__c (before insert, before update) 
{
    List<Address__c> l_address = Trigger.new;
    
    for(Address__c ad : l_address)
        {
            ad.External_Key__c = 
                ad.name + '_' +
                ad.Street2__c + '_' +
                ad.City__c + '_' +
                ad.state__c + '_' +
                ad.Zip__c;
        }
}