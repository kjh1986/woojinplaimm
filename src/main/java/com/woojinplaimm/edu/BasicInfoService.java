package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.*;

public interface BasicInfoService {
	
	public List<BasicInfo> roomList(SearchKeyValue skv);
	public String roomInsert(BasicInfo bi);
	public String roomUpdate(BasicInfo bi);
	public String roomDelete(BasicInfo bi);
	//과목
	public List<BasicInfo> subjectList(SearchKeyValue skv);
	public String subjectInsert(BasicInfo bi);
	public String subjectUpdate(BasicInfo bi);
	public String subjectDelete(BasicInfo bi);

	//과정
	public List<BasicInfo> courseList(SearchKeyValue skv);
	public String courseInsert(BasicInfo bi);
	public String courseUpdate(BasicInfo bi);
	public String courseDelete(BasicInfo bi);
	
	//과정구분
	public List<BasicInfo> ocdList(SearchKeyValue skv);
	public String ocdInsert(BasicInfo bi);
	public String ocdUpdate(BasicInfo bi);
	public String ocdDelete(BasicInfo bi);
	
	//직종구분
	public List<BasicInfo> jobList(SearchKeyValue skv);
	public String jobInsert(BasicInfo bi);
	public String jobUpdate(BasicInfo bi);
	public String jobDelete(BasicInfo bi);
	
	//훈련비구분
	public List<BasicInfo> tuitionList(SearchKeyValue skv);
	public String tuitionInsert(BasicInfo bi);
	public String tuitionUpdate(BasicInfo bi);
	public String tuitionDelete(BasicInfo bi);
}
