public with sharing class AccountController {
    static Account acc;
    @AuraEnabled
    public static String getSave(String accname,String accnumber){
        try{
            acc = new Account();
            acc.Name = accname;
            acc.accountnumber = accnumber;
            // system.debug(accname+String.valueOf(accnumber)+'test');
            //acc.Type = type;
            insert acc;            
        }catch(exception e){
            return e.getMessage();
        }
        return acc.id;      
    }    
    @AuraEnabled
    public static String Edit1(String accname,String accnumber,String idd,String type){
        try{
            
            acc = [Select id,name,accountnumber,type from account where id =:idd];
            acc.Name = accname;
            acc.accountnumber = accnumber;
            acc.type = type;        
            update acc;
            system.debug(acc.Id);
        }catch(exception e){
            return e.getMessage();
        }
        return acc.id;        
    }
    
    @AuraEnabled
    public static Account fetchaccount(Id Idd){
        
        String accstring = '';
        acc = [Select id,name,accountnumber,Type from account where id =:idd];
        // accstring = JSON.serialize(acc);
        //  return accstring;
        return acc;
    }
    
    @AuraEnabled
    public static String deleteaccount(Id Idd){
        try{
            acc = [Select id,name,accountnumber,Type from account where id =:idd];
            delete acc;
            return  'Deleted';
        } catch(Exception e){
            
            return e.getMessage();
        }
    }
}