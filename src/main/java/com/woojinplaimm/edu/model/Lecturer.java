package com.woojinplaimm.edu.model;

//���� ���� �ڷ��� ��ü
public class Lecturer {
	//����⺻
	private String lec_id,lec_name,lec_tel, lec_sub
		//����, ��������
		,sub_id,sub_name,os_id,oc_id;

	

	public String getLec_sub() {
		return lec_sub;
	}

	public void setLec_sub(String lec_sub) {
		this.lec_sub = lec_sub;
	}

	public String getLec_id() {
		return lec_id;
	}

	public void setLec_id(String lec_id) {
		this.lec_id = lec_id;
	}

	public String getLec_name() {
		return lec_name;
	}

	public void setLec_name(String lec_name) {
		this.lec_name = lec_name;
	}

	public String getLec_tel() {
		return lec_tel;
	}

	public void setLec_tel(String lec_tel) {
		this.lec_tel = lec_tel;
	}

	public String getSub_id() {
		return sub_id;
	}

	public void setSub_id(String sub_id) {
		this.sub_id = sub_id;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}

	public String getOs_id() {
		return os_id;
	}

	public void setOs_id(String os_id) {
		this.os_id = os_id;
	}

	public String getOc_id() {
		return oc_id;
	}

	public void setOc_id(String oc_id) {
		this.oc_id = oc_id;
	}
	
	

}
