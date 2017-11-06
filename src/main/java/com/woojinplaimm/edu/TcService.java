package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;
import com.woojinplaimm.edu.model.TakeCourse;

//Spring MVC Framework에서는 추상화를 위해서 interface를 사용한다.
public interface TcService {
	public OpenCourse courseSearch(SearchKeyValue skv);
	public List<Student> tcStUpdateList(OpenCourse oc);
	public List<BasicInfo> tuitionList();
	public String tcUpdate(Student student);
	public String tcDelete(TakeCourse tc);
	public List<Student> tcStInsertList(SearchKeyValue skv);
	public List<BasicInfo> stdList();
	public int studentTotal();
	public int searchCount(SearchKeyValue skv);
	public String tcInsert(TakeCourse tc);
	public String csInsert(TakeCourse tc);
	public void tcDropInsert(TakeCourse tc);
	public void tcDropDelete(TakeCourse tc);
	public String csUpdate(Student st);
	public String csDelete(Student st);

}
