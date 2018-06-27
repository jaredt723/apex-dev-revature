@RestResource (urlMapping='/GetCase2/*')
global class RestCaseCreation {

    @HttpGet
    global static Case getCaseByID(){
        RestRequest request = RestContext.request;
        String caseID = request.requestURI.substring(request.requestURI.lastindexof('/')+1);
        Case res = [select casenumber, subject, status, origin, priority FROM Case where id =: caseid];
        return res;
    }
}