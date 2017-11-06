package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MyBatis에서는 추상화를 위해서 interface를 사용한다.
public interface OcDAO {
	public List<OpenCourse> ocList(SearchKeyValue skv);
	public int ocInsert(OpenCourse oc)throws Exception;
	public int ocUpdate(OpenCourse oc)throws Exception;
	public int ocDelete(OpenCourse oc)throws Exception;
	public int ocTotal();
	public int searchCount(SearchKeyValue skv);
	public OpenCourse ocInfo(OpenCourse oc);
	public List<BasicInfo> ocdList();
	public List<BasicInfo> jfList();
	public List<BasicInfo> courseList();
	public List<BasicInfo> subjectList();
	public List<BasicInfo> ocOsLecList(BasicInfo bi);
	public int ocOsInsert(OpenCourse os)throws Exception;
	public List<OpenCourse> ocOsDeleteList(OpenCourse oc);
	public int ocOsDelete(OpenCourse os)throws Exception;
	
	
	
}
