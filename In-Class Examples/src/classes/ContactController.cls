public with sharing class ContactController {
    
    @AuraEnabled
    public static String retcontactname(id i) {
        list<Contact> con = new list<Contact>();
        try{
            con = [select name from contact where id =:i];
            system.debug(con[0].name);
        }catch(System.ListException e){
            return 'error';      
        }
        
        return con[0].name;
    }
    
    @AuraEnabled
    public static String getaccount(id i) {
        list<Account> acc = new List<Account>();
        try{
            acc = [select id, name, (select id, name from contacts) from Account where id =: i];
        } catch(System.ListException e){
            return 'error';
        }
        return acc[0].Name;
    }
    
    @AuraEnabled
    public static String getaccountContact(id i){
        list<Account> acc = new List<Account>();
        try{
            acc = [select id, name, (select id, name from contacts) from Account where id =: i];
        } catch(System.ListException e){
            return 'error';
        }
        return acc[0].contacts[0].name;
    }
    
    @AuraEnabled
    public static List<Contact> findAll() {
        return [SELECT id, name, phone FROM contact limit 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name = '%' + searchKey + '%';
        return [SELECT id, name, phone FROM contact WHERE name LIKE :name LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findById(String contactId){
        return [SELECT id, name, title, phone, mobilephone, Account.Name
               FROM Contact WHERE ID =: contactID];
    }
    
}