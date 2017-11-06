package com.woojinplaimm.edu.model;

import java.util.*;

//�������� ��� �� �ʿ� ���� �ڷ��� ��ü
public class Education {
	//���������⺻
	private String oc_id,course_id,ocd_code,job_family_code,oc_note,job_family_name,ocd_name,course_name
		//����, ���� ��
		,os_id,sub_name,sub_id,lecturer_id, lecturer_name, lecturer_tel
		//��������, ��, ���� �� 
		,tc_id,drop_date,cs_id;
			
	private int	oc_timeofedu,oc_goals_num,money,before_score,after_score,survey_score;
	
	private Date oc_start_date,oc_finish_date,cs_date;

	public String getOc_id() {
		return oc_id;
	}

	public void setOc_id(String oc_id) {
		this.oc_id = oc_id;
	}

	public String getCourse_id() {
		return course_id;
	}

	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}

	public String getOcd_code() {
		return ocd_code;
	}

	public void setOcd_code(String ocd_code) {
		this.ocd_code = ocd_code;
	}

	public String getJob_family_code() {
		return job_family_code;
	}

	public void setJob_family_code(String job_family_code) {
		this.job_family_code = job_family_code;
	}

	public String getOc_note() {
		return oc_note;
	}

	public void setOc_note(String oc_note) {
		this.oc_note = oc_note;
	}

	public String getJob_family_name() {
		return job_family_name;
	}

	public void setJob_family_name(String job_family_name) {
		this.job_family_name = job_family_name;
	}

	public String getOcd_name() {
		return ocd_name;
	}

	public void setOcd_name(String ocd_name) {
		this.ocd_name = ocd_name;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getOs_id() {
		return os_id;
	}

	public void setOs_id(String os_id) {
		this.os_id = os_id;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}

	public String getSub_id() {
		return sub_id;
	}

	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}

	public String getLecturer_id() {
		return lecturer_id;
	}

	public void setLecturer_id(String lecturer_id) {
		this.lecturer_id = lecturer_id;
	}

	public String getLecturer_name() {
		return lecturer_name;
	}

	public void setLecturer_name(String lecturer_name) {
		this.lecturer_name = lecturer_name;
	}

	public String getLecturer_tel() {
		return lecturer_tel;
	}

	public void setLecturer_tel(String lecturer_tel) {
		this.lecturer_tel = lecturer_tel;
	}

	public String getTc_id() {
		return tc_id;
	}

	public void setTc_id(String tc_id) {
		this.tc_id = tc_id;
	}

	public String getDrop_date() {
		return drop_date;
	}

	public void setDrop_date(String drop_date) {
		this.drop_date = drop_date;
	}

	public String getCs_id() {
		return cs_id;
	}

	public void setCs_id(String cs_id) {
		this.cs_id = cs_id;
	}

	public int getOc_timeofedu() {
		return oc_timeofedu;
	}

	public void setOc_timeofedu(int oc_timeofedu) {
		this.oc_timeofedu = oc_timeofedu;
	}

	public int getOc_goals_num() {
		return oc_goals_num;
	}

	public void setOc_goals_num(int oc_goals_num) {
		this.oc_goals_num = oc_goals_num;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getBefore_score() {
		return before_score;
	}

	public void setBefore_score(int before_score) {
		this.before_score = before_score;
	}

	public int getAfter_score() {
		return after_score;
	}

	public void setAfter_score(int after_score) {
		this.after_score = after_score;
	}

	public int getSurvey_score() {
		return survey_score;
	}

	public void setSurvey_score(int survey_score) {
		this.survey_score = survey_score;
	}

	public Date getOc_start_date() {
		return oc_start_date;
	}

	public void setOc_start_date(Date oc_start_date) {
		this.oc_start_date = oc_start_date;
	}

	public Date getOc_finish_date() {
		return oc_finish_date;
	}

	public void setOc_finish_date(Date oc_finish_date) {
		this.oc_finish_date = oc_finish_date;
	}

	public Date getCs_date() {
		return cs_date;
	}

	public void setCs_date(Date cs_date) {
		this.cs_date = cs_date;
	}

	
}
