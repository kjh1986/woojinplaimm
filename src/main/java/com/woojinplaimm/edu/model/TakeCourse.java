package com.woojinplaimm.edu.model;

import java.util.List;

public class TakeCourse {
	String oc_id, st_id, tc_id, cs_date, cs_id, t_code;
	
	public String getT_code() {
		return t_code;
	}

	public void setT_code(String t_code) {
		this.t_code = t_code;
	}

	int tc_sale;
	
	public int getTc_sale() {
		return tc_sale;
	}

	public void setTc_sale(int tc_sale) {
		this.tc_sale = tc_sale;
	}

	public String getCs_date() {
		return cs_date;
	}

	public void setCs_date(String cs_date) {
		this.cs_date = cs_date;
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

	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	public String getOc_id() {
		return oc_id;
	}

	public void setOc_id(String oc_id) {
		this.oc_id = oc_id;
	}

	List<Student> students;

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}
	
}
