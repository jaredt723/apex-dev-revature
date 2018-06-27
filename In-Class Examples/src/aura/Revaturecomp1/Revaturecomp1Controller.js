({
    calculate1 : function(component, event, helper) {
        /*var x = component.get("v.Amount");
            var y = component.get("v.Tenure");
            var z = 0;
            if(y < 12){
                z = x + 1000;
            }
            if(y > 12) {
                z = x - 1000;
            }
            component.set("v.Maturity", z);
            console.log(z);*/
        var inputcmp = component.find("tenure");
        var val = inputcmp.get("v.value");
        if(val >21){
            
            inputcmp.set("v.errors",[{message :'Value cant be greater than 21 using compset'}]);
            //add the line to remove class and show error message on text1
        }else {
            helper.calculateHelper(component);
            
        }
        
    },
    addcss :function(component, event, helper){
        helper.toggleCSS(component, 1);
    },
    
    removecss : function(component, event, helper) {
        helper.toggleCSS(component, 0);
    },
    
    getcontactname : function(component, event, helper){
        var action = component.get("c.retcontactname");
        action.setParams({ i: component.get("v.Conid")});
        action.setCallback(this, function(a){
            if(a.getReturnValue() != 'error'){
                console.log('Error returned from apex');
                $A.util.removeClass(component.find("text1"), 'toggle1');
            } else {
                console.log(component.get("v.Contid"));
                component.set("v.ContactName", a.getReturnValue());
            }
            //alert(a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    getaccountinfo : function(component, event, helper){
        var action = component.get("c.getaccount");
        action.setParams({ i: component.get("v.AccID")});
        action.setCallback(this, function(a){
            if(a.getReturnValue() == 'error'){
                console.log('Error returned from apex');
                $A.util.removeClass(component.find("text1"), 'toggle1');
            } else {
                console.log(component.get("v.Contid"));
                component.set("v.AccName", a.getReturnValue());
            }
            //alert(a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    getaccContact : function(component, event, helper){
        var action = component.get("c.getaccountContact");
        action.setParams({ i: component.get("v.AccID")});
        action.setCallback(this, function(a){
            if(a.getReturnValue() == 'error'){
                console.log('Error returned from apex');
                $A.util.removeClass(component.find("text1"), 'toggle1');
            } else {
                console.log(component.get("v.Contid"));
                component.set("v.ContactName", a.getReturnValue());
            }
            //alert(a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})