({
    save : function(component, event, helper) {
        var accnum = component.get("v.accObj.AccountNumber");
        var name = component.get("v.accObj.Name");
        
        console.log(component.get("v.recordId"));
        
        var action = component.get("c.getSave");
        action.setParams({"accname" : name, "accnumber" : accnum });
        action.setCallback(this, function(a) {
            var x = a.getReturnValue();
            console.log(x);
            
            event.setParams({
                "recordId": x ,
                "slideDevName": "related"   
            }); 
            event.fire();
        });
        $A.enqueueAction(action);
        var event = $A.get('e.force:navigateToSObject');
        
    }
})