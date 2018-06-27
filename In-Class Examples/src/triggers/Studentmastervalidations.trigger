trigger Studentmastervalidations on StudentMaster__c (before delete, before insert) {

    if(Trigger.isBefore){
         if(Trigger.isDelete){
             for(StudentMaster__c SMref : trigger.old){
                 if(SMref.name == 'Alexis Apexis'){
                     SMref.addError('Cannot delete this record.');
                 }
             }
         }
         
         if(Trigger.isInsert){
             Date myDate = Date.newInstance(2017, 5, 8);
             for(StudentMaster__c SMref : trigger.new){
                 if(SMref.age__c < 18){
                     SMref.addError('Student cannot be younger than 18 years of age.');
                 }
                 
                 if(SMref.DOJ__c < myDate){
                     SMref.addError('DOJ must not be before May 8, 2017.');
                 }
             }   
         }
    }

}