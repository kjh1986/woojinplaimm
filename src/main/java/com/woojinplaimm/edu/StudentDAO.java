package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;

//MyBatis에서는 추상화를 위해서 interface를 사용한다.
public interface StudentDAO {
	public List<Student> studentList(SearchKeyValue skv);
	public int studentInsert(Student st)throws Exception;
	public int studentUpdate(Student st)throws Exception;
	public int studentDelete(Student st)throws Exception;
	public Student studentInfo(Student st);
	public Student acStudentInfo(Student st);
	public List<Company> companyList();
	public Student trainStudentInfo(Student st);
	public int searchCount(SearchKeyValue skv);
	public int studentTotal();
	public String getStdById(Student st);
	public List<Student> stdList();
	public int studentstdInsert(Student st) throws Exception;
	public int studentstdDelete(Student st) throws Exception;
	public int studentacUpdate(Student st) throws Exception;
	public int studentacInsert(Student st) throws Exception;
	public Student acCheck(Student st);
	public int studentacDelete(Student st) throws Exception;
	public Student trainCheck(Student st);
	public int studenttrainInsert(Student st) throws Exception;
	public int studenttrainUpdate(Student st) throws Exception;
	public int studenttrainDelete(Student st) throws Exception;
	public int pictureAdd(Student st) throws Exception;
	public String picCheck(Student st);
	public int pictureUpdate(Student st);
	public int pictureDelete(Student st);
	public List<Student> studentExcelList(SearchKeyValue skv);
	
}
