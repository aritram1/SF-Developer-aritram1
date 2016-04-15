public class class_testApexFunction{

    public class_testApexFunction(ApexPages.StandardController controller) {

    }

    public PageReference apexMethod(){
        database.insert(new Contact(lastname='testcontact'));
        return new Pagereference('www.google.com');
        //return new Pagereference('/0018000000WPiRK');
    }
}