({
    save : function(component, event, helper) {
        var accnum = component.get("v.accObj.AccountNumber");
        var name = component.get("v.accObj.Name");
        console.log(component.get("v.accObj.AccountNumber"));
        
        console.log(component.get("v.accObj.Name"));
        
        console.log(component.get("v.recordId"));
        
        /*var action = component.get("c.getSave");
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
        var event = $A.get('e.force:navigateToSObject');*/
        
        var editrecordid = component.get("v.recordId");
        var x = '';
        var action = '';
        console.log(editrecordid+'recid');
        if(editrecordid =='' || editrecordid == undefined){
            action = component.get("c.getSave");
            action.setParams({"accname": name, "accnumber" : accnum, "type": component.find("mySelect").get("v.value")});
            //console.log('inside empty recid' +component.find("mySelect").get("v.value"));
            
        } else {
            action = component.get("c.Edit1");
            //action.setParams({"accname" : name, "accnumber" : accnum, "idd" :editrecordid, "type": component.find("mySelect").get("v.value")});
            action.setParams({"accname" : name, "accnumber" : accnum, "idd" :editrecordid});
            //console.log('inside non empty recid' + component.find("mySelect").get("v.value"));
        }
        action.setCallback(this, function(a) {
            var x = a.getReturnValue();
            console.log(x);
            
            event.setParams({
                "recordId": x ,
                "slideDevName": "related"   
            }); 
            event.fire();
    });
    
    },
    
    doInit : function(component, event, helper) {
        //var jsonString = '';
        //var jsonobj = '';
        var action= component.get("c.fetchaccount");
        if(component.get("v.recordId") == undefined){
            console.log('inside firstif:'+component.get("v.recordId"));
        } else {
            console.log('inside else ' + component.get("v.recordId"));
            action.setParams({Idd : component.get("v.recordId")});
            action.setCallback(this, function(a){
                component.set("v.accObj", a.getReturnValue());
            });
            $A.enqueueAction(action);
        }
        
    }
 })