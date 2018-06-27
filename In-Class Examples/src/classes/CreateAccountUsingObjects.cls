public with sharing class CreateAccountUsingObjects {

    public void createAccountsWithList(){
        Integer x = 0;
        Account acc;
        List<Account> accList = new List<Account>();
        while(x < 300){
            acc = new Account(Name='Dell Alienware'+x);
            accList.add(acc);
            x++;
        }
        insert accList;
    }
    
    public void deleteAlienwareAccounts(){
        List<Account> accs = [select ID from Account where Name like 'Dell Alienware%'];
		delete accs;
    }
    
    public ID createAccount(String accName){
        Account acc = new Account(Name = accname);
        insert acc;
        return acc.id;
    }
    
    public List<Contact> fetchAccountsAndContacts(){
        List <Account> acclist = new List<Account>();
		List <Contact> contlist = new List<Contact>();
        List <Contact> accContacts = new List<Contact>();
		acclist = [select id, name, (select id, name from Contacts) from Account];
		for(Account acc:acclist){
  			contlist = acc.contacts;
    		for(Contact ctt:contlist){
        		accContacts.add(ctt);
    		}
		}
        return accContacts;
    }
    
    public void createStudentMaster(Integer age, String name){
        StudentMaster__c sm = new StudentMaster__c();
        sm.age__c = age;
        sm.Name = name;
        insert sm;
    }
    
}