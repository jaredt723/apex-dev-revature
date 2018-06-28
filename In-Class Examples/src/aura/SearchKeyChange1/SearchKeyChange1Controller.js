({
    searchKeyChange : function(component, event, helper) {
        //debugger;
        var myEvent = $A.get("e.c:searchkeychange");
        console.log('fired keyboard event with the following value'+event.target.value);
        
        myEvent.setParams({"searchkey": event.target.value});
        // debugger;
        myEvent.fire();
        //alert(myEvent.getParam("searchkey1"));
    }
})