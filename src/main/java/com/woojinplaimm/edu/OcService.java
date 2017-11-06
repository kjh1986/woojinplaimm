package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;

//Spring MVC Framework에서는 추상화를 위해서 interface를 사용한다.
public interface OcService {
	public List<OpenCourse> ocList(SearchKeyValue skv);
	public String ocInsert(OpenCourse oc);
	public String ocUpdate(OpenCourse oc);
	public String ocDelete(OpenCourse oc);
	public int ocTotal();
	public int searchCount(SearchKeyValue skv);
	public OpenCourse ocInfo(OpenCourse oc);
	public List<BasicInfo> ocdList();
	public List<BasicInfo> jfList();
	public List<BasicInfo> courseList();
	public List<BasicInfo> subjectList();
	public List<BasicInfo> ocOsLecList(BasicInfo bi);
	public String ocOsInsert(OpenCourse os);
	public List<OpenCourse> ocOsDeleteList(OpenCourse oc);
	public String ocOsDelete(OpenCourse os);
	

}
