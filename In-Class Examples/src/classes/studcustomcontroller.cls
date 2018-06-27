public with sharing class studcustomcontroller{
    //getstudents is the getter method. In the VF page, refer to this as students-- don't use getstudents.
	public List<studentmaster__c> getstudents(){
		List<studentmaster__c> students = database.query('select name, department__c from studentmaster__c');
		return students;
	}
}