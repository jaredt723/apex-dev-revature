trigger AccountTrigger on Account (after insert, before delete) {
    List<Contact> cInsert = new List<Contact>();
    
    if(Trigger.IsInsert){
        for(Account a : Trigger.new){
            if(a.Name == 'Revature'){
                Contact c = new Contact();
                c.FirstName = 'Rev';
                c.LastName = 'Training';
                c.Type__c = 'Student';
                cInsert.add(c);
            }
        }
          
    }
    insert cInsert;
    
    if(Trigger.IsDelete){
        for(Account a : Trigger.old){
            if(a.Name == 'Revature'){
                a.adderror('Account Cannot be deleted');
            }
        }
    }

}