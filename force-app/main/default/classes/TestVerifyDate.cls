@isTest
public class TestVerifyDate {
    
    @isTest static void TestDate2BeingInThePast() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(20);
        
        Date setDate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, setDate); 
    }

    @isTest static void TestEndMonthOfAGivenDate() {
        Date dateAtStartOfMonth = Date.newInstance(2020, 07, 01);
        Integer daysToEndMonth = Date.daysInMonth(dateAtStartOfMonth.year(), dateAtStartOfMonth.month());
        Date dateAtEndofMonth = Date.newInstance(dateAtStartOfMonth.year(), dateAtStartOfMonth.month(), daysToEndMonth); 

        Date newDate = VerifyDate.CheckDates(dateAtStartOfMonth, dateAtEndofMonth);
        System.assertEquals(Date.newInstance(2020, 07, 31), dateAtEndofMonth);




    }

}
