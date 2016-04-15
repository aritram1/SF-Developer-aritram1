global class testEmailService implements Messaging.InboundEmailHandler{
    global Messaging.InboundEmailResult handleInboundEmail
        (Messaging.InboundEmail email,Messaging.InboundEnvelope env){
            Messaging.InboundEmailResult res = new Messaging.InboundEmailResult();    
            String fromAdd = '';
            fromAdd = env.fromAddress;
            Contact c = new Contact();
            c.lastname = 'email Service Contact';
            c.email = fromAdd;
            insert c;
            res.success = true;
            return res;
    }
}