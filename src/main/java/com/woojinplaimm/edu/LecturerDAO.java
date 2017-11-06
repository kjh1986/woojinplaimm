package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.Lecturer;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MyBatis에서는 추상화를 위해서 interface를 사용한다.
public interface LecturerDAO {

	// 전체 자료 반환 메소드
	public List<Lecturer> lecturerList(SearchKeyValue skv);
	public int lecturerInsert(Lecturer lec)throws Exception;
	public int lecturerUpdate(Lecturer lec)throws Exception;
	public int lecturerDelete(Lecturer lec)throws Exception;
	public List<Lecturer> insertSubjectList(Lecturer lec);
	public int insertLecsub(Lecturer lec)throws Exception;
	public List<Lecturer> deleteSubjectList(Lecturer lec);
	public int deleteLecsub(Lecturer lec)throws Exception;
}
