public class studmastextension {
    
	//Stamping with get/set allows this variable to be used in VF page. 
    private final studentmaster__c studmast;
    public PageReference pg; //redirect
    public ApexPages.StandardController ourstdcontroller; //to access std controller
    StudentMaster__c std = new StudentMaster__c();
    public Boolean togglescreen {get;set;}
    
    public StudentMaster__c sm {get;set;}
    
    public studmastextension(ApexPages.StandardController stdController){
        this.studmast = (studentmaster__c)stdController.getRecord();
        ourstdcontroller = stdController;
        sm = new StudentMaster__c();
        sm.Name = 'ExtensionTest';
        sm.Age__c = 15;        
    }
    
    //unnecessary
    /*public void changetogglevalue(){
togglescreen = !togglescreen;
}*/
    
    public string getWelcomeMsg(){
        String msg = 'This was returned from the extension!';
        return msg;
        
    }
    
    public PageReference saveandredirect(){
        ourstdcontroller.save(); 
        pg = new PageReference('/' + studmast.id);
        pg.setRedirect(true);
        System.debug(studmast.id);
        return pg;   
    }
    
    public PageReference saveandredirect2(){
        
        std.Name = sm.Name;
        std.Age__c = sm.Age__c;
        try{
        	insert std;
        }
        catch(DMLexception e){
            apexpages.AddMessages(e);
            sm.Age__c.adderror('Must be 18+');
            return null;
        }
        //ourstdcontroller.save();
        pg = new PageReference('/' + std.id);
        pg.setRedirect(true);
        System.debug(std.id);
        return pg;
        
    }
}