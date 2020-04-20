package pickme.com.a.util;

import java.util.Calendar;

public class EApplyUtil {

	public static String dots(String msg) {
		
		String str = "";
		if(msg.length() >= 35){
			str = msg.substring(0, 35);
			str += "..."; 
		}else{
			str = msg.trim();	
		}
		return str;
		
	}
	
	
	public static String todayMsg(String sdate) {
		
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int intMonth = cal.get(Calendar.MONTH) + 1;
		int intDate = cal.get(Calendar.DATE);
		System.out.println(year+ "-" + intMonth + "-" + intDate);
		String month= intMonth + "";
		String date= intDate + "";
		
		
		if(intMonth < 10) {
			month = "0" + intMonth;
		}
		
		if(intDate < 10) {
			date = "0" + intDate;
		}
		
		if(sdate.substring(0,10).equals(year+ "-" + month + "-" + date)) {
				sdate = sdate.substring(11,16);
		}else {
			sdate = sdate.substring(0,10);
		}
		return sdate;
	}
	
	
	
}
