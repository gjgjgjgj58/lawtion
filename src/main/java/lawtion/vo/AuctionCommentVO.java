package lawtion.vo;

public class AuctionCommentVO {
	int ano, cno, total, total2, lawyer;
	public int getLawyer() {
		return lawyer;
	}
	public int getTotal2() {
		return total2;
	}
	public void setTotal2(int total2) {
		this.total2 = total2;
	}
	public void setLawyer(int lawyer) {
		this.lawyer = lawyer;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	String content, cdate, ctotal, btotal;
	public String getCtotal() {
		this.ctotal = "¥Ò±€ "+total;
		return ctotal;
	}
	public String getBtotal() {
		this.btotal = total2+"∏Ì¿« ¿‘¬˚¿⁄";
		return btotal;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
	
}
