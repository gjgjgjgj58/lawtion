package lawtion.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class TalkBoardVO {
	int rno, no, hits, pre_seq, pre_hits, next_seq, next_hits;
	String title, content, name, fname, tdate, code,rfname;
	CommonsMultipartFile file;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getRfname() {
		return rfname;
	}
	public void setRfname(String rfname) {
		this.rfname = rfname;
	}
	public CommonsMultipartFile getFile() {
		return file;
	}
	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}
	public int getNext_seq() {
		return next_seq;
	}
	public void setNext_seq(int next_seq) {
		this.next_seq = next_seq;
	}
	public int getNext_hits() {
		return next_hits;
	}
	public void setNext_hits(int next_hits) {
		this.next_hits = next_hits;
	}
	public String getNext_title() {
		return next_title;
	}
	public void setNext_title(String next_title) {
		this.next_title = next_title;
	}
	public String getNext_content() {
		return next_content;
	}
	public void setNext_content(String next_content) {
		this.next_content = next_content;
	}
	public String getNext_name() {
		return next_name;
	}
	public void setNext_name(String next_name) {
		this.next_name = next_name;
	}
	public String getNext_fname() {
		return next_fname;
	}
	public void setNext_fname(String next_fname) {
		this.next_fname = next_fname;
	}
	public String getNext_tdate() {
		return next_tdate;
	}
	public void setNext_tdate(String next_tdate) {
		this.next_tdate = next_tdate;
	}
	String pre_title, pre_content, pre_name, pre_fname, pre_tdate;
	String next_title, next_content, next_name, next_fname, next_tdate;
	public int getRno() {
		return rno;
	}
	public int getPre_seq() {
		return pre_seq;
	}
	public int getPre_hits() {
		return pre_hits;
	}
	public void setPre_hits(int pre_hits) {
		this.pre_hits = pre_hits;
	}
	public void setPre_seq(int pre_seq) {
		this.pre_seq = pre_seq;
	}
	public String getPre_title() {
		return pre_title;
	}
	public void setPre_title(String pre_title) {
		this.pre_title = pre_title;
	}
	public String getPre_content() {
		return pre_content;
	}
	public void setPre_content(String pre_content) {
		this.pre_content = pre_content;
	}
	public String getPre_name() {
		return pre_name;
	}
	public void setPre_name(String pre_name) {
		this.pre_name = pre_name;
	}
	public String getPre_fname() {
		return pre_fname;
	}
	public void setPre_fname(String pre_fname) {
		this.pre_fname = pre_fname;
	}
	public String getPre_tdate() {
		return pre_tdate;
	}
	public void setPre_tdate(String pre_tdate) {
		this.pre_tdate = pre_tdate;
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
		if(content.equals("")||content.equals(null)){
			this.content="empty";
		}else{
			this.content = content.replaceAll("<br>","\r\n");
		}
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String rdate) {
		this.tdate = rdate;
	}
	
	
}
