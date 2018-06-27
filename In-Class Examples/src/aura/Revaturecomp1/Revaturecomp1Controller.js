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
    }
})