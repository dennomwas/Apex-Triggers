@isTest
global class AnimalLocatorMock implements HttpCalloutMock {

    global HttpResponse respond( HttpRequest request) {
        // create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setStatusCode(200);
        response.setBody('{"animal":{"id":1,"name":"chicken","eats":"chicken food","says":"cluck cluck"}}');
        return response;
    }
}