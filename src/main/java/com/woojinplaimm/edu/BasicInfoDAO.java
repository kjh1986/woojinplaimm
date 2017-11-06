package com.woojinplaimm.edu;

import java.util.List;
import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.SearchKeyValue;


public interface BasicInfoDAO {
	//숙소
	public List<BasicInfo> roomList(SearchKeyValue skv);
	public int roomInsert(BasicInfo bi)throws Exception;
	public int roomUpdate(BasicInfo bi)throws Exception;
	public int roomDelete(BasicInfo bi)throws Exception;

	//과목
	public List<BasicInfo> subjectList(SearchKeyValue skv);
	public int subjectInsert(BasicInfo bi)throws Exception;
	public int subjectUpdate(BasicInfo bi)throws Exception;
	public int subjectDelete(BasicInfo bi)throws Exception;

	//과정
	public List<BasicInfo> courseList(SearchKeyValue skv);
	public int courseInsert(BasicInfo bi)throws Exception;
	public int courseUpdate(BasicInfo bi)throws Exception;
	public int courseDelete(BasicInfo bi)throws Exception;
	
	//과정구분
	public List<BasicInfo> ocdList(SearchKeyValue skv);
	public int ocdInsert(BasicInfo bi)throws Exception;
	public int ocdUpdate(BasicInfo bi)throws Exception;
	public int ocdDelete(BasicInfo bi)throws Exception;
	
	//직종구분
	public List<BasicInfo> jobList(SearchKeyValue skv);
	public int jobInsert(BasicInfo bi)throws Exception;
	public int jobUpdate(BasicInfo bi)throws Exception;
	public int jobDelete(BasicInfo bi)throws Exception;
	
	//훈련비구분
	public List<BasicInfo> tuitionList(SearchKeyValue skv);
	public int tuitionInsert(BasicInfo bi)throws Exception;
	public int tuitionUpdate(BasicInfo bi)throws Exception;
	public int tuitionDelete(BasicInfo bi)throws Exception;
	
}
