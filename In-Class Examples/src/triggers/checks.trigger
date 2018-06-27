trigger checks on Lead (before delete, before insert, before update, after delete, after insert, after update, after undelete) {
    If(Trigger.isbefore){
        if(trigger.isinsert){
            System.debug('Value of trigger.new is in beforeinsertis :'+trigger.new );
            System.debug('Value of trigger.old is in beforeinsertis :'+trigger.old);
        }
        
        if(trigger.isupdate){
            System.debug('Value of trigger.new is in beforeupdateis :'+trigger.new );
            System.debug('Value of trigger.old is in beforeupdateis :'+trigger.old);
        }
        
        if(trigger.isdelete){
            System.debug('Value of trigger.new is in beforedeleteis :'+trigger.new );
            System.debug('Value of trigger.old is in beforedeleteis :'+trigger.old);
        }
    }
    
    If(Trigger.isafter){
        if(trigger.isinsert){
            System.debug('Value of trigger.new is in afterinsertis :'+trigger.new );
            System.debug('Value of trigger.old is in afterinsertis :'+trigger.old);
        }
        
        if(trigger.isupdate){
            System.debug('Value of trigger.new is in afterupdateis :'+trigger.new );
            System.debug('Value of trigger.old is in afterupdateis :'+trigger.old);
        }
        
        if(trigger.isdelete){
            System.debug('Value of trigger.new is in afterdeleteis :'+trigger.new );
            System.debug('Value of trigger.old is in afterdeleteis :'+trigger.old);
        }
        
        if(trigger.isundelete){
            System.debug('Value of trigger.new is in afterundeleteis :'+trigger.new );
            System.debug('Value of trigger.old is in afterundeleteis :'+trigger.old);
        }
    }
}