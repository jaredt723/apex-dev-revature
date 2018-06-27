public class customacctcontroller {
	public List<Account> getAccounts(){
		List<Account> accs = database.query('select name, AccoutSource, Rating, Type, NumberOfemployees, Industry, AnnualRevenue, BillingCity, BillingState, ShippingCity, ShippingState, Phone, Faxfrom studentmaster__c FROM Account');
		return accs;
	}
}