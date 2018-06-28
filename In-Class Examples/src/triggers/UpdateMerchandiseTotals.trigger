trigger UpdateMerchandiseTotals on Line_Item__c (after insert, before update, after delete) {

    if(Trigger.isInsert){
        List<Merchandise__c> items = new List<Merchandise__c>();
        for (Line_Item__c li : Trigger.new){
            Merchandise__c m = [select id, Quantity__c from Merchandise__c where id =: li.Merchandise__c];
            m.Quantity__c -= li.Quantity__c;
            items.add(m);
            
        }
        update items;
    }
    
    if(Trigger.isUpdate){
        List<Merchandise__c> items = new List<Merchandise__c>();
        Map<ID, Line_Item__c> liMap =Trigger.oldmap;
        for (Line_Item__c li : Trigger.new){
            Merchandise__c m = [select id, Quantity__c from Merchandise__c where id =: li.Merchandise__c];
            m.Quantity__c += liMap.get(li.id).Quantity__c;
            m.Quantity__c -= li.Quantity__c;
            items.add(m);
        }
        update items;
    }
    
    if(Trigger.isDelete){
        List<Merchandise__c> items = new List<Merchandise__c>();
        for (Line_Item__c li : Trigger.old){
            Merchandise__c m = [select id, Quantity__c from Merchandise__c where id =: li.Merchandise__c];
            m.Quantity__c += li.Quantity__c;
            items.add(m);
        }
        update items;
    }
}