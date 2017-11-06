package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;
import com.woojinplaimm.edu.model.TakeCourse;

//MyBatis에서는 추상화를 위해서 interface를 사용한다.
public interface TcDAO {

	public OpenCourse courseSearch(SearchKeyValue skv);
	public List<Student> tcStUpdateList(OpenCourse oc);
	public List<BasicInfo> tuitionList();
	public int tcUpdate(Student student)throws Exception;
	public int tcDelete(TakeCourse tc)throws Exception;
	public List<Student> tcStInsertList(SearchKeyValue skv);
	public List<BasicInfo> stdList();
	public int studentTotal();
	public int searchCount(SearchKeyValue skv);
	public int tcInsert(TakeCourse tc)throws Exception;
	public void tcDropInsert(TakeCourse tc)throws Exception;
	public void tcDropDelete(TakeCourse tc)throws Exception;
	public int csInsert(TakeCourse tc);
	public int csUpdate(Student st);
	public int csDelete(Student st);
	
	
}
