package com.woojinplaimm.edu.model;

import java.util.*;

public class Student {
			
	private String st_id, st_name, st_ssn,st_birth, pic_filename, st_age, std_code, st_tel, st_email, st_carnum, st_note, room_id, room_name,st_regdate
		
		, std_name, st_eduback,	st_license,	st_location, hope_location,	hope_pay, management_id, st_addr
		
		, com_id, com_name, ac_st_dept, job_title, emp_id, com_tel
		
		,cs_id,tc_id, course_name, oc_id, old_cs_id, cs_date
		
		,t_name, t_code, tc_drop, tc_complete;
	
	public String getOld_cs_id() {
		return old_cs_id;
	}

	public void setOld_cs_id(String old_cs_id) {
		this.old_cs_id = old_cs_id;
	}

	public String getCs_date() {
		return cs_date;
	}

	public void setCs_date(String cs_date) {
		this.cs_date = cs_date;
	}

	public String getTc_complete() {
		return tc_complete;
	}

	public void setTc_complete(String tc_complete) {
		this.tc_complete = tc_complete;
	}

	List<Student> stds;
	List<Company> comids;

	public List<Student> getStds() {
		return stds;
	}

	public void setStds(List<Student> stds) {
		this.stds = stds;
	}

	public List<Company> getComids() {
		return comids;
	}

	public void setComids(List<Company> comids) {
		this.comids = comids;
	}

	public String getTc_drop() {
		return tc_drop;
	}

	public void setTc_drop(String tc_drop) {
		this.tc_drop = tc_drop;
	}

	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	private int tc_sale;
	
	
	
	
	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public int getTc_sale() {
		return tc_sale;
	}

	public void setTc_sale(int tc_sale) {
		this.tc_sale = tc_sale;
	}

	public String getManagement_id() {
		return management_id;
	}

	public void setManagement_id(String management_id) {
		this.management_id = management_id;
	}

	public String getSt_addr() {
		return st_addr;
	}

	public void setSt_addr(String st_addr) {
		this.st_addr = st_addr;
	}

	public String getCom_tel() {
		return com_tel;
	}

	public void setCom_tel(String com_tel) {
		this.com_tel = com_tel;
	}

	public String getCom_id() {
		return com_id;
	}

	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getPic_filename() {
		return pic_filename;
	}

	public void setPic_filename(String pic_filename) {
		this.pic_filename = pic_filename;
	}

	public String getSt_birth() {
		return st_birth;
	}

	public void setSt_birth(String st_birth) {
		this.st_birth = st_birth;
	}

	public String getSt_age() {
		return st_age;
	}

	public void setSt_age(String st_age) {
		this.st_age = st_age;
	}

	public String getSt_regdate() {
		return st_regdate;
	}

	public void setSt_regdate(String st_regdate) {
		this.st_regdate = st_regdate;
	}

	public String getRoom_id() {
		return room_id;
	}

	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	
	public String getCs_id() {
		return cs_id;
	}

	public void setCs_id(String cs_id) {
		this.cs_id = cs_id;
	}

	public String getTc_id() {
		return tc_id;
	}

	public void setTc_id(String tc_id) {
		this.tc_id = tc_id;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getOc_id() {
		return oc_id;
	}

	public void setOc_id(String oc_id) {
		this.oc_id = oc_id;
	}

	
	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_ssn() {
		return st_ssn;
	}

	public void setSt_ssn(String st_ssn) {
		this.st_ssn = st_ssn;
	}

	public String getStd_code() {
		return std_code;
	}

	public void setStd_code(String std_code) {
		this.std_code = std_code;
	}

	public String getSt_tel() {
		return st_tel;
	}

	public void setSt_tel(String st_tel) {
		this.st_tel = st_tel;
	}

	public String getSt_email() {
		return st_email;
	}

	public void setSt_email(String st_email) {
		this.st_email = st_email;
	}

	public String getSt_carnum() {
		return st_carnum;
	}

	public void setSt_carnum(String st_carnum) {
		this.st_carnum = st_carnum;
	}

	public String getSt_note() {
		return st_note;
	}

	public void setSt_note(String st_note) {
		this.st_note = st_note;
	}

	public String getStd_name() {
		return std_name;
	}

	public void setStd_name(String std_name) {
		this.std_name = std_name;
	}

	public String getSt_eduback() {
		return st_eduback;
	}

	public void setSt_eduback(String st_eduback) {
		this.st_eduback = st_eduback;
	}

	public String getSt_license() {
		return st_license;
	}

	public void setSt_license(String st_license) {
		this.st_license = st_license;
	}

	public String getSt_location() {
		return st_location;
	}

	public void setSt_location(String st_location) {
		this.st_location = st_location;
	}

	public String getHope_location() {
		return hope_location;
	}

	public void setHope_location(String hope_location) {
		this.hope_location = hope_location;
	}

	public String getHope_pay() {
		return hope_pay;
	}

	public void setHope_pay(String hope_pay) {
		this.hope_pay = hope_pay;
	}



	public String getAc_st_dept() {
		return ac_st_dept;
	}

	public void setAc_st_dept(String ac_st_dept) {
		this.ac_st_dept = ac_st_dept;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public String getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	
	
	
}
