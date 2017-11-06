package com.woojinplaimm.edu;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.woojinplaimm.edu.model.Lecturer;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MemberService인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
//@Service 어노테이션은 Service 클래스를 Spring 객체로 등록
@Service
public class LecturerServiceImpl implements LecturerService{
	
	//MemberDAO 객체(MemberDAOImpl)에 대한 의존주입 설정 추가
	//@Inject 어노테이션이용(byType에의한 의존주입)
	@Inject
	private LecturerDAO dao;
	public void setDao(LecturerDAO dao) {
		this.dao = dao;
	}
	@Override
	public List<Lecturer> lecturerList(SearchKeyValue skv) {
		return dao.lecturerList(skv);
	}
	@Override
	public String lecturerInsert(Lecturer lec) {
		int temp=0;
		try {
			temp = dao.lecturerInsert(lec);
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
	public String lecturerUpdate(Lecturer lec){
		int temp=0;
		try {
			temp = dao.lecturerUpdate(lec);
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
	public String lecturerDelete(Lecturer lec) {
		int temp=0;
		try {
			temp = dao.lecturerDelete(lec);
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
	public List<Lecturer> insertSubjectList(Lecturer lec) {
		return dao.insertSubjectList(lec);
	}
	@Override
	public String insertLecsub(Lecturer lec) {
		int temp=0;
		try {
			temp = dao.insertLecsub(lec);
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
	public List<Lecturer> deleteSubjectList(Lecturer lec) {
		return dao.deleteSubjectList(lec);
	}
	@Override
	public String deleteLecsub(Lecturer lec) {
		int temp=0;
		try {
			temp = dao.deleteLecsub(lec);
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

}
