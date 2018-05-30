package lawtion.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class joinLayerVO {
	String id,password,name,birth,phone,email;
	String jdate,phone1,phone2,phone3,years,months,days;
	String business,license,business_no,license_no,rbusiness,rlicense;
	CommonsMultipartFile fileBusiness;
	CommonsMultipartFile fileLicense;
	
	
	public CommonsMultipartFile getFileBusiness() {
		return fileBusiness;
	}

	public void setFileBusiness(CommonsMultipartFile fileBusiness) {
		this.fileBusiness = fileBusiness;
		System.out.println(this.fileBusiness.getOriginalFilename());
	}

	public CommonsMultipartFile getFileLicense() {
		return fileLicense;
	}

	public void setFileLicense(CommonsMultipartFile fileLicense) {
		this.fileLicense = fileLicense;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public String getLicense_no() {
		return license_no;
	}

	public void setLicense_no(String license_no) {
		this.license_no = license_no;
	}

	public String getRbusiness() {
		return rbusiness;
	}

	public void setRbusiness(String rbusiness) {
		this.rbusiness = rbusiness;
	}

	public String getRlicense() {
		return rlicense;
	}

	public void setRlicense(String rlicense) {
		this.rlicense = rlicense;
	}

	public String getYears() {
		return years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getMonths() {
		return months;
	}

	public void setMonths(String months) {
		this.months = months;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getJdate() {
		return jdate;
	}

	public void setJdate(String jdate) {
		this.jdate = jdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		System.out.print("id="+id);
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return years+"."+months+"."+days;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone1+phone2+phone3;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBusiness() {
		return business;
	}

	public void setBusiness(String business) {
		this.business = business;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

}
