trigger ContactTrigger on Contact (before insert, before delete) {
    List<Contact> cInsert = new List<Contact>();
    
    if(Trigger.IsInsert){
        for(Contact c : Trigger.new){
            if(c.Type__c == 'Student'){
                List<Account> a = [SELECT ID FROM Account Where Name = 'Revature'];
                c.Accountid = a[0].id;
            }
        }
        
    }
    //insert cInsert;
        
   if(Trigger.IsDelete){
        for(Contact c : Trigger.old){
            if(c.FirstName == 'Rev' && c.LastName == 'Training'){
                c.adderror('Contact Cannot be deleted.');
            }
        }
    }
}