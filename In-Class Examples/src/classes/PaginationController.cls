public class PaginationController {
    public List<Contact> contactlist {get;set;}
    
    public Integer breakpoint {get;set;}
    public apexPages.StandardSetController apcontactset{get;set;}
    public String str = ' ';
    public Integer xx = 5;
    public Id contactid {get;set;}
    public String contactname {get;set;}
    public Integer maxbreak {get;set;}
    
    //get total count of records
    public PaginationController(){
        system.debug('inside constructor');
        firstpage();
        maxbreak = database.countQuery('select count() from contact') / xx - 1;
        breakpoint = 0;
    }
    
    public void firstpage(){
        system.debug('inside firstpage');
        str = 'select id,firstname,lastname from contact';
        apcontactset = new ApexPages.StandardSetController(Database.getQueryLocator(str));
        apcontactset.setpagesize(xx);
        contactList = new List<Contact>();
        contactList = (List<Contact>)apcontactset.getRecords();
        breakpoint = 1;
        system.debug('inside firstpage'+':'+contactlist+':'+apcontactset);
    }
    
    public void nextpage(){
        //apcontactset.save();
        str = 'select id,firstname, lastname from contact limit 20 offset 6';
        apcontactset.next();
        
        contactlist = (List<contact>)apcontactset.getRecords();
        system.debug('inside secondpage'+':'+contactlist+':'+apcontactset);
        breakpoint++;
    }
    
    public void prevpage(){
        //apcontactset.save();
        str = 'select id,firstname, lastname from contact limit 20 offset 6';
        apcontactset.previous();
        contactlist = (List<Contact>)apcontactset.getRecords();
        system.debug('prevpage');
        breakpoint--;
        
    }
    
    public void updatecontact(){
        System.debug(ApexPages.currentPage().getParameters().get('contactid'));
        List<Contact> cn = new List<Contact>();
        cn = [select id, firstname, lastname from contact where id=:contactid];
        if(cn.size() > 0 ){
            cn[0].lastname = contactname;
            update cn;
            system.debug(cn[0].lastname);
        }
        
        //system.debug(cn[0].lastname + this.contactname);
        
        //system.debug(cn[0].lastname + this.contactname);
    }
    
    public void save(){
        apcontactset.save();
    }
}