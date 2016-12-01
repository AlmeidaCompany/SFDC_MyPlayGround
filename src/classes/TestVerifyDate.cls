@isTest
public class TestVerifyDate {
	@isTest static void CheckDatesTestWithIn30(){
		VerifyDate.CheckDates(System.today(),System.today().addDays(5));
    }
    @isTest static void CheckDatesTestNotWithIn(){
		VerifyDate.CheckDates(System.today(),System.today().addDays(40));
    }
}