package com.woojinplaimm.edu.model;

public class OpenCourse {
	private String oc_id, course_id, course_name, oc_start_date, oc_finish_date, oc_timeofedu, ocd_code,ocd_name
		, job_family_code, job_family_name, t_code, t_name, oc_note,ing,lecsub,subs,os_id,lec_id,sub_id;

	private int oc_goals_num, money;
	
	
	public String getLecsub() {
		return lecsub;
	}
	public void setLecsub(String lecsub) {
		this.lecsub = lecsub;
	}
	public String getSub_id() {
		return sub_id;
	}
	public String getLec_id() {
		return lec_id;
	}
	public void setLec_id(String lec_id) {
		this.lec_id = lec_id;
	}
	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}
	public String getOs_id() {
		return os_id;
	}
	public void setOs_id(String os_id) {
		this.os_id = os_id;
	}
	public String getSubs() {
		return subs;
	}
	public void setSubs(String subs) {
		this.subs = subs;
	}
	
	
	
	
	public int getOc_goals_num() {
		return oc_goals_num;
	}
	public void setOc_goals_num(int oc_goals_num) {
		this.oc_goals_num = oc_goals_num;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	
	
	public String getOc_id() {
		return oc_id;
	}
	public void setOc_id(String oc_id) {
		this.oc_id = oc_id;
	}
	
	public String getOc_start_date() {
		return oc_start_date;
	}
	public void setOc_start_date(String oc_start_date) {
		this.oc_start_date = oc_start_date;
	}
	public String getOc_finish_date() {
		return oc_finish_date;
	}
	public void setOc_finish_date(String oc_finish_date) {
		this.oc_finish_date = oc_finish_date;
	}
	public String getOc_timeofedu() {
		return oc_timeofedu;
	}
	public void setOc_timeofedu(String oc_timeofedu) {
		this.oc_timeofedu = oc_timeofedu;
	}
	
	public String getOcd_code() {
		return ocd_code;
	}
	public void setOcd_code(String ocd_code) {
		this.ocd_code = ocd_code;
	}
	public String getOcd_name() {
		return ocd_name;
	}
	public void setOcd_name(String ocd_name) {
		this.ocd_name = ocd_name;
	}
	public String getJob_family_code() {
		return job_family_code;
	}
	public void setJob_family_code(String job_family_code) {
		this.job_family_code = job_family_code;
	}
	public String getJob_family_name() {
		return job_family_name;
	}
	public void setJob_family_name(String job_family_name) {
		this.job_family_name = job_family_name;
	}
	public String getT_code() {
		return t_code;
	}
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getOc_note() {
		return oc_note;
	}
	public void setOc_note(String oc_note) {
		this.oc_note = oc_note;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
}
