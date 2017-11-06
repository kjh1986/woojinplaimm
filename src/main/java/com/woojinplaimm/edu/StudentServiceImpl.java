package com.woojinplaimm.edu;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;

//MemberService인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
//@Service 어노테이션은 Service 클래스를 Spring 객체로 등록
@Service
public class StudentServiceImpl implements StudentService{
	
	//MemberDAO 객체(MemberDAOImpl)에 대한 의존주입 설정 추가
	//@Inject 어노테이션이용(byType에의한 의존주입)
	@Inject
	private StudentDAO dao;
	public void setDao(StudentDAO dao) {
		this.dao = dao;
	}
	@Override
	public List<Student> studentList(SearchKeyValue skv) {
		return dao.studentList(skv);
	}
	@Override
	public String studentInsert(Student st) {
		int temp=0;
		try {
			temp = dao.studentInsert(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "101";
		if(temp > 0) {
			result = "100";
		}
		return result;
	}
	@Override
	public String studentUpdate(Student st) {
		int temp=0;
		try {
			temp = dao.studentUpdate(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "201";
		if(temp > 0) {
			result = "200";
		}
		return result;
	}
	@Override
	public String studentDelete(Student st) {
		int temp=0;
		try {
			temp = dao.studentDelete(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "301";
		if(temp > 0) {
			result = "300";
		}
		return result;
	}
	@Override
	public Student studentInfo(Student st) {
		return dao.studentInfo(st);
	}
	@Override
	public Student acStudentInfo(Student st) {
		return dao.acStudentInfo(st);
	}
	@Override
	public List<Company> companyList() {
		return dao.companyList();
	}
	@Override
	public Student trainStudentInfo(Student st) {
		return dao.trainStudentInfo(st);
	}
	@Override
	public int searchCount(SearchKeyValue skv) {
		return dao.searchCount(skv);
	}
	@Override
	public int studentTotal() {
		return dao.studentTotal();
	}
	@Override
	public String getStdById(Student st) {
		return dao.getStdById(st);
	}
	@Override
	public List<Student> stdList() {
		return dao.stdList();
	}
	@Override
	public String studentstdInsert(Student st) {
		int temp=0;
		try {
			temp = dao.studentstdInsert(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "401";
		if(temp > 0) {
			result = "400";
		}
		return result;
	}
	@Override
	public String studentstdDelete(Student st) {
		int temp=0;
		try {
			temp = dao.studentstdDelete(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "501";
		if(temp > 0) {
			result = "500";
		}
		return result;
	}
	@Override
	public String studentacUpdate(Student st) {
		int temp=0;
		try {
			temp = dao.studentacUpdate(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "701";
		if(temp > 0) {
			result = "700";
		}
		return result;
	}
	@Override
	public String studentacInsert(Student st) {
		int temp=0;
		try {
			temp = dao.studentacInsert(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "601";
		if(temp > 0) {
			result = "600";
		}
		return result;
	}
	@Override
	public Student acCheck(Student st) {
		return dao.acCheck(st);
	}
	@Override
	public String studentacDelete(Student st) {
		int temp=0;
		try {
			temp = dao.studentacDelete(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "801";
		if(temp > 0) {
			result = "800";
		}
		return result;
	}
	@Override
	public Student trainCheck(Student st) {
		return dao.trainCheck(st);
	}
	@Override
	public String studenttrainInsert(Student st) {
		int temp=0;
		try {
			temp = dao.studenttrainInsert(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "901";
		if(temp > 0) {
			result = "900";
		}
		return result;
	}
	@Override
	public String studenttrainUpdate(Student st) {
		int temp=0;
		try {
			temp = dao.studenttrainUpdate(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "1001";
		if(temp > 0) {
			result = "1000";
		}
		return result;
	}
	@Override
	public String studenttrainDelete(Student st) {
		int temp=0;
		try {
			temp = dao.studenttrainDelete(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "1101";
		if(temp > 0) {
			result = "1100";
		}
		return result;
	}
	@Override
	public String pictureAdd(Student st) {
		int temp=0;
		try {
			temp = dao.pictureAdd(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "1201";
		if(temp > 0) {
			result = "1200";
		}
		return result;
	}
	@Override
	public String picCheck(Student st) {
		return dao.picCheck(st);
	}

	@Override
	public String pictureUpdate(Student st) {
		int temp=0;
		try {
			temp = dao.pictureUpdate(st);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = "1201";
		if(temp > 0) {
			result = "1200";
		}
		return result;
	}
	@Override
	public void pictureDelete(Student st) {
		dao.pictureDelete(st);
	}
	@Override
	public List<Student> studentExcelList(SearchKeyValue skv) {
		
		return dao.studentExcelList(skv);
	}
	

}
