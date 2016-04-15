@RestResource(urlMapping='/requestyourapp')
global with sharing class RequestYourApplication{

  @HttpPost
    global static void doPost() {
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        JSONGenerator gen;
        gen = JSON.createGenerator(true);
        gen.writeStartObject();            
        try{
            Request_your_app_comments__c appComment;        
            String requestBody = request.requestBody.toString().trim();
            appComment = (Request_your_app_comments__c)JSON.deserialize(requestBody, Request_your_app_comments__c.class);
            System.debug('appComment -->' + appComment );
            insert appComment;            
            //gen.writeStringField('id',appComment.id);
            //gen.writeStringField('Name',appComment.name);
            gen.writeStringField('result','success');
        }
        catch (exception e){
            System.debug('Error Occurred -> ' + e);
            gen.writeStringField('result','error');
        }
        finally{
            gen.writeEndObject();
            response.responseBody = Blob.valueof(gen.getAsString());
            response.addheader('Content-Type','application/json; charset=UTF-8');
            gen = null;
        }
    }
}