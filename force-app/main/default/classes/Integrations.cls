public class Integrations {

    public static void AirtimeIntegration() {    
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        String username = 'sandbox';
        String apiKey = '6d6cc631b0e73d2f48d66d9a5323a026ecfe7a4996c6fcd3bebe0f9f8d7e9d09';
		String params = 'username=sandbox&recipients=[{"phoneNumber":"+254723042098","amount":"KES 21.0"}]';
        
        request.setEndpoint('https://api.sandbox.africastalking.com/version1/airtime/send?'+ params);
        request.setMethod('POST');
        request.setHeader('Accept', 'application/json');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setHeader('apiKey', apiKey);
        
        system.debug('Request '+ request);
        
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 201) {
            System.debug(response.getBody());
        } else {
            System.debug('The status code returned was not expected: ' +
            response.getStatusCode() + ' ' + response.getStatus());
        }
    }
}