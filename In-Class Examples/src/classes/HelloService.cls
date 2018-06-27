global class HelloService {
    webservice static String sayHello(String name, String phone){
           Contact con = new Contact(LastNAme = name, homephone = phone);
           insert con;
           return 'Hello ' + con.Name + ' ! : ' + con.Id;
           
    }
}