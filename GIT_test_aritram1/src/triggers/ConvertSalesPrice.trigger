trigger ConvertSalesPrice on Product2 (before insert,before update) {
    
    Product2[] p = Trigger.new;
    String cur = p[0].Currency__c;
    String FromCurrency = 'USD';
    String ToCurrency = cur;
    
    p[0].Converted_Price__c = [Select Conversion_Factor__c from Currency_converter__c where From_Currency__c= :FromCurrency AND To_Currency__c = :cur].Conversion_Factor__c;
}