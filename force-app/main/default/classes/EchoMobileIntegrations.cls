public class EchoMobileIntegrations {
    public class MessageBody {
        // Send message object to help deserialize the request body
        public List<String> phone;
        public String message;
        public String digest;
   }
    public static void lookupClients() {
        String data = 'data={"phone":"254723042098"}';
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('account-id', AccountAuthHeader());
        request.setHeader('Accept', 'application/form-data');
        request.setHeader('Content-Type', 'application/form-data');
        request.setEndpoint('callout:EchoMobileBaseUrl/api/clients/lookup');
        request.setMethod('POST');
        request.setBody(data);
        try {
            HttpResponse response = http.send(request);
            system.debug(request.getHeader('account-id'));
            System.debug(response.getBody());
        } catch (CalloutException e) {
            System.debug('Callout error '+ e);
            
        }
    }

    public static void GetAccountDetails() {
        // GET 'api/cms/account/me' endpoint
        // Get account details together with any linked accounts of the api user

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('account-id', AccountAuthHeader());
        request.setHeader('Accept', 'application/form-data');
        request.setHeader('Content-Type', 'application/form-data');
        request.setEndpoint('callout:EchoMobileBaseUrl/api/cms/account/me');
        request.setMethod('GET');
        try {
            HttpResponse response = http.send(request);
            System.debug(response.getBody());
        } catch (CalloutException e) {
            System.debug('Callout error '+ e);
        }
    }

    public static void SendMessage(List<String> phoneNumbers, String messageToSend) {
        // POST 'api/messaging/send' endpoint
        // Send a message to a specified phone number from the default outgoing 
        // message gateway for the authenticated account.

        String MD5_PW = 'a812801c81bdf2';
        String messsage = messageToSend;
        List<String> phone = phoneNumbers;

        Blob requestBlob = Blob.valueOf(MD5_PW+','+phone+','+messsage);
        Blob hash = Crypto.generateDigest('MD5', requestBlob);
        String digest = EncodingUtil.base64Encode(hash); //Converts the blob to string

        MessageBody newMsg = new MessageBody();
        newMsg.phone = phone;
        newMsg.message = messsage;
        newMsg.digest = digest;

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('account-id', AccountAuthHeader());
        request.setHeader('Accept', 'application/form-data');
        request.setHeader('Content-Type', 'application/form-data');
        request.setEndpoint('callout:EchoMobileBaseUrl/api/messaging/send');
        request.setMethod('POST');
        request.setBody('data='+JSON.serialize(newMsg));
        system.debug('data='+JSON.serialize(newMsg));
        try {
            HttpResponse response = http.send(request);        
            System.debug(response.getBody());
        } catch (CalloutException e ) {
            System.debug('Callout error: '+ e);
        }
        
    }

    public static void FetchSurveyResponse() {
        // POST 'api/v2/survey_data' endpoint
        // Fetch survey responses (aka survey data pull). 
        // The fetch is done a page at a time.
        
        String data = '{"skey":"6041695564201984"}';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('account-id', AccountAuthHeader());
        request.setEndpoint('callout:EchoMobileBaseUrl/api/v2/survey_data');
        request.setMethod('POST');
        request.setBody(data);
        HttpResponse response = http.send(request);
        system.debug(request.getHeader('account-id'));
        System.debug(response.getBody());
    }

    public static void GetInboxMessageLog() {
        // GET api/cms/msglog endpoint
        // Lists message logs within caller's enterprise

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('account-id', AccountAuthHeader());
        request.setEndpoint('callout:EchoMobileBaseUrl/api/cms/msglog');
        request.setMethod('GET');
        try {
            HttpResponse response = http.send(request);
            System.debug(response.getBody());    
        } catch (CalloutException e) {
            System.debug('Callout Error '+ e.getMessage());
        }   
    }
    public static String AccountAuthHeader() {
        // Generates and encoded account-id for authentication
        String accountId = '5008362218586112';       
		Blob accountValue = Blob.valueOf(accountId);
        String EncodedAccountId = EncodingUtil.base64Encode(accountValue);
        
        return EncodedAccountId;
    }
}

