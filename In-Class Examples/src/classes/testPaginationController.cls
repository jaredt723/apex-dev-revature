@isTest
public class testPaginationController {
    @isTest static void test(){
        PaginationController p = new PaginationController();
        p.contactname = 'Adams';
        p.firstpage();
        p.nextpage();
        p.prevpage();
        p.updatecontact();
        p.save();
        
    }
}