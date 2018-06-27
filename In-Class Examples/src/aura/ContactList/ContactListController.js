({
	doInit : function(component, event) {
        var action = component.get("c.findAll");
        action.setCallback(this, function(a){
            component.set("v.contacts", a.getReturnValue())            
        });
        console.log(component.get("v.contacts"));
        $A.enqueueAction(action);
		
	}
})