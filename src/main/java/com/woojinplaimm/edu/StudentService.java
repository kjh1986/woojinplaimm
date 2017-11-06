package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;

//Spring MVC Framework에서는 추상화를 위해서 interface를 사용한다.
public interface StudentService {

	public List<Student> studentList(SearchKeyValue skv);
	public String studentInsert(Student st);
	public String studentUpdate(Student st);
	public String studentDelete(Student st);
	public Student studentInfo(Student st);
	public Student acStudentInfo(Student st);
	public List<Company> companyList();
	public Student trainStudentInfo(Student st);
	public int searchCount(SearchKeyValue skv);
	public int studentTotal();
	public String getStdById(Student st);
	public List<Student> stdList();
	public String studentstdInsert(Student st);
	public String studentstdDelete(Student st);
	public String studentacUpdate(Student st);
	public String studentacInsert(Student st);
	public Student acCheck(Student st);
	public String studentacDelete(Student st);
	public Student trainCheck(Student st);
	public String studenttrainInsert(Student st);
	public String studenttrainUpdate(Student st);
	public String studenttrainDelete(Student st);
	public String pictureAdd(Student st);
	public String picCheck(Student st);
	public String pictureUpdate(Student st);
	public void pictureDelete(Student st);
	public List<Student> studentExcelList(SearchKeyValue skv);

}
