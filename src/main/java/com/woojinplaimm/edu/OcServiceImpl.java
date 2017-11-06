package com.woojinplaimm.edu;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MemberService인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
//@Service 어노테이션은 Service 클래스를 Spring 객체로 등록
@Service
public class OcServiceImpl implements OcService{
	
	//MemberDAO 객체(MemberDAOImpl)에 대한 의존주입 설정 추가
	//@Inject 어노테이션이용(byType에의한 의존주입)
	@Inject
	private OcDAO dao;
	public void setDao(OcDAO dao) {
		this.dao = dao;
	}
	@Override
	public List<OpenCourse> ocList(SearchKeyValue skv) {
		return dao.ocList(skv);
	}
	@Override
	public String ocInsert(OpenCourse oc) {
		int temp=0;
		try {
			temp = dao.ocInsert(oc);
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
	public String ocUpdate(OpenCourse oc) {
		int temp=0;
		try {
			temp = dao.ocUpdate(oc);
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
	public String ocDelete(OpenCourse oc) {
		int temp=0;
		try {
			temp = dao.ocDelete(oc);
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
	public int ocTotal() {
		return dao.ocTotal();
	}
	@Override
	public int searchCount(SearchKeyValue skv) {
		return dao.searchCount(skv);
	}
	@Override
	public OpenCourse ocInfo(OpenCourse oc) {
		return dao.ocInfo(oc);
	}
	@Override
	public List<BasicInfo> ocdList() {
		return dao.ocdList();
	}
	@Override
	public List<BasicInfo> jfList() {
		return dao.jfList();
	}
	@Override
	public List<BasicInfo> courseList() {
		return dao.courseList();
	}
	@Override
	public List<BasicInfo> subjectList() {
		return dao.subjectList();
	}
	@Override
	public List<BasicInfo> ocOsLecList(BasicInfo bi) {
		return dao.ocOsLecList(bi);
	}
	@Override
	public String ocOsInsert(OpenCourse os) {
		int temp=0;
		try {
			temp = dao.ocOsInsert(os);
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
	public List<OpenCourse> ocOsDeleteList(OpenCourse oc) {
		return dao.ocOsDeleteList(oc);
	}
	@Override
	public String ocOsDelete(OpenCourse os) {
		int temp=0;
		try {
			temp = dao.ocOsDelete(os);
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
