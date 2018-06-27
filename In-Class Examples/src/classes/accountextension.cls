public class accountextension {
    
    private final Account acc;
    public PageReference pg; //redirect
    public ApexPages.StandardController ourstdcontroller; //to access std controller
    
	public accountextension(ApexPages.StandardController stdController){
        this.acc = (Account)stdController.getRecord();
        ourstdcontroller = stdController;
    }
    
    public PageReference saveandredirect(){
        List<Contact> cs = [SELECT id FROM Contact WHERE AccountID =: acc.id];
        ourstdcontroller.save();
        pg = new PageReference('/' + cs[0].id);
        pg.setRedirect(true);
        System.debug(acc.id);
        return pg;
    }
}