package com.woojinplaimm.edu.model;

public class SearchKeyValue {
	private String key, value, std_code, ing, oc_id;
	
	public String getOc_id() {
		return oc_id;
	}

	public void setOc_id(String oc_id) {
		this.oc_id = oc_id;
	}

	public String getIng() {
		return ing;
	}

	public void setIng(String ing) {
		this.ing = ing;
	}

	private int startIndex, lastIndex;

	public String getStd_code() {
		return std_code;
	}

	public void setStd_code(String std_code) {
		this.std_code = std_code;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
