trigger After_Create_EmailTrigger on Candidate__c (after insert){


    Candidate__c c = Trigger.new[0];
    String msg1,msg2;
    
    //c.Name = Trigger.new[0].Name;
    //c.id = Trigger.new[0].id;    
    
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    
    String[] toAddresses = new String[] {'aritra.mukherjee@cognizant.com'};
    String[] ccAddresses = new String[] {'aritram1@gmail.com'};
    
    mail.setToAddresses(toAddresses);
    mail.setCcAddresses(ccAddresses);
    mail.setReplyTo('bubun2me@yahoo.co.in');
    mail.setSenderDisplayName('Sachin Tendulkar');
    mail.setSubject('New Candidate Created : ' + c.Name);
    mail.setBccSender(true);
    mail.setUseSignature(false);
    mail.setPlainTextBody('A candidate of autonumber ' + c.Name + ' has been created');
    
    msg1 = 'A Candidate of autonumber ' + c.Name +' has been created.<p>View the record ';
    msg2 = '<a href=https://na6.salesforce.com/' + c.id + '>here</a>';
    String msg = msg1 + msg2; 
    mail.setHtmlBody(msg);
    
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    System.debug('Mail has been sent');
}