package lawtion.deadline;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class AuctionBoardDeadLine {
	
	String tm, maxtm;
	
	public String getTm() {
		return tm;
	}

	public void setTm(String tm) {
		this.tm = tm;
	}

	public String getMaxtm() {
		return maxtm;
	}

	public void setMaxtm(String maxtm) {
		this.maxtm = maxtm;
	}

	public void deadlineDate(){
		//내일의 날짜 구하기
		Calendar cal1 = Calendar.getInstance(); 
		Calendar cal2 = Calendar.getInstance();
		cal1.setTime(new Date());
		cal1.add(Calendar.DATE, 1);
		//Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		//String td = date.format(today);
		tm = date.format(cal1.getTime());
		cal2.add(Calendar.DATE, 21);
		maxtm = date.format(cal2.getTime());
	}
	
}



