({
    /*helperMethod : function() {
		
	}*/
    calculateHelper : function(component) {
        var x = component.get("v.Amount");
        var y = component.get("v.Tenure");
        var z = 0;
        if(y < 12){
            z = x + 1000;
        }
        if(y > 12) {
            z = x - 1000;
        }
        component.set("v.Maturity", z);
        console.log(z);
    },
    
    toggleCSS : function(component, flag) {
        if(flag){
            $A.util.addClass(component, 'changeMe');
            $A.util.removeClass(component.find('text'), 'toggle1');            
        } else {
            $A.util.removeClass(component, 'changeMe');
            $A.util.addClass(component.find('text'), 'toggle1');
        }
        
    }
})