package com.woojinplaimm.edu.model;


public class Company {
	private String com_id,com_name,com_tel,com_inurance_id,com_ceo_name
		,com_postnum,com_addr,com_type_biz,com_type_biz_detail,com_note,dc;
	private int com_empnum;
	public String getDc() {
		return dc;
	}
	public void setDc(String dc) {
		this.dc = dc;
	}
	private String ac_date,ac_renew_date,ac_cancel_date,oj_date;
	
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
	public String getCom_tel() {
		return com_tel;
	}
	public void setCom_tel(String com_tel) {
		this.com_tel = com_tel;
	}
	public String getCom_inurance_id() {
		return com_inurance_id;
	}
	public void setCom_inurance_id(String com_inurance_id) {
		this.com_inurance_id = com_inurance_id;
	}

	public int getCom_empnum() {
		return com_empnum;
	}
	public void setCom_empnum(int com_empnum) {
		this.com_empnum = com_empnum;
	}
	public String getCom_ceo_name() {
		return com_ceo_name;
	}
	public void setCom_ceo_name(String com_ceo_name) {
		this.com_ceo_name = com_ceo_name;
	}
	public String getCom_postnum() {
		return com_postnum;
	}
	public void setCom_postnum(String com_postnum) {
		this.com_postnum = com_postnum;
	}
	
	public String getCom_addr() {
		return com_addr;
	}
	public void setCom_addr(String com_addr) {
		this.com_addr = com_addr;
	}
	public String getCom_type_biz() {
		return com_type_biz;
	}
	public void setCom_type_biz(String com_type_biz) {
		this.com_type_biz = com_type_biz;
	}
	public String getCom_type_biz_detail() {
		return com_type_biz_detail;
	}
	public void setCom_type_biz_detail(String com_type_biz_detail) {
		this.com_type_biz_detail = com_type_biz_detail;
	}
	public String getCom_note() {
		return com_note;
	}
	public void setCom_note(String com_note) {
		this.com_note = com_note;
	}
	public String getAc_date() {
		return ac_date;
	}
	public void setAc_date(String ac_date) {
		this.ac_date = ac_date;
	}
	public String getAc_renew_date() {
		return ac_renew_date;
	}
	public void setAc_renew_date(String ac_renew_date) {
		this.ac_renew_date = ac_renew_date;
	}
	public String getAc_cancel_date() {
		return ac_cancel_date;
	}
	public void setAc_cancel_date(String ac_cancel_date) {
		this.ac_cancel_date = ac_cancel_date;
	}
	public String getOj_date() {
		return oj_date;
	}
	public void setOj_date(String oj_date) {
		this.oj_date = oj_date;
	}



}
