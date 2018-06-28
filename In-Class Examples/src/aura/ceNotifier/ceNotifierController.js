({
	fireComponentEvent2 : function(cmp, event) {
       // Get the component event by using the
       // name value from aura:registerEvent
       var cmpEvent = cmp.getEvent("cmpEvent");
       cmpEvent.setParams({
           "message" : "A component event fired me. " +
           "It all happened so fast. Now, I'm here!" });
       cmpEvent.fire();
   }
})