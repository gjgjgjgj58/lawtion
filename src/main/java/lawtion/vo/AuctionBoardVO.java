package lawtion.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class AuctionBoardVO {
	int rno, no, hits, btotal;
	long e;
	String title, content, fname, adate, category, edate, area, agree;
	public int getBtotal() {
		return btotal;
	}
	public void setBtotal(int btotal) {
		this.btotal = btotal;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		if(category.equals("ex1")){
			category = "민사";
		}
		if(category.equals("ex2")){
			category = "형사";
		}
		this.category = category;
	}
	public long getE() {
		return e;
	}
	public void setE() throws Exception {
		
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(new Date());
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String today = date.format(cal1.getTime());
		
		Date begin = date.parse(today);
		Date end = date.parse(edate);
		
		long diff = end.getTime() - begin.getTime();
        long diffDays = diff / (24 * 60 * 60 * 1000);
		
		this.e = diffDays;
		
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		if(area.equals("1")){
			area = "강원";
		}
		if(area.equals("2")){
			area = "경기";
		}
		this.area = area;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
}
