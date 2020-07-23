public class AnimalLocator {

    public static String getAnimalNameById(Integer id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');

        String stringResult = '';
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            stringResult = animal.get('name').toString();            
            
        } else {
        System.debug('Could not complete request '+ 
                        response.getStatus()+' '+ response.getStatusCode());
        }
        return stringResult;
    }
}