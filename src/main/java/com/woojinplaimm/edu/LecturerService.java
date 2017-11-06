package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.Lecturer;
import com.woojinplaimm.edu.model.SearchKeyValue;

//Spring MVC Framework에서는 추상화를 위해서 interface를 사용한다.
public interface LecturerService {

	public List<Lecturer> lecturerList(SearchKeyValue skv);
	public String lecturerInsert(Lecturer lec);
	public String lecturerUpdate(Lecturer lec);
	public String lecturerDelete(Lecturer lec);
	public List<Lecturer> insertSubjectList(Lecturer lec);
	public String insertLecsub(Lecturer lec);
	public List<Lecturer> deleteSubjectList(Lecturer lec);
	public String deleteLecsub(Lecturer lec);

}
