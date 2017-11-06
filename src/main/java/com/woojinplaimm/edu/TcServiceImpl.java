package com.woojinplaimm.edu;

import java.util.List;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;
import com.woojinplaimm.edu.model.TakeCourse;

//MemberService인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
//@Service 어노테이션은 Service 클래스를 Spring 객체로 등록
@Service
public class TcServiceImpl implements TcService{
	private Logger logger = LoggerFactory.getLogger(TcServiceImpl.class);
	
	//MemberDAO 객체(MemberDAOImpl)에 대한 의존주입 설정 추가
	//@Inject 어노테이션이용(byType에의한 의존주입)
	@Inject
	private TcDAO dao;
	public void setDao(TcDAO dao) {
		this.dao = dao;
	}
	
	@Override
	public OpenCourse courseSearch(SearchKeyValue skv) {
		return dao.courseSearch(skv);
	}
	@Override
	public List<Student> tcStUpdateList(OpenCourse oc) {
		return dao.tcStUpdateList(oc);
	}
	@Override
	public List<BasicInfo> tuitionList() {
		return dao.tuitionList();
	}
	@Override
	public String tcUpdate(Student st) {
		int temp=0;
		try {
			temp = dao.tcUpdate(st);
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
	public String tcDelete(TakeCourse tc) {
		int temp=0;
		try {
			temp = dao.tcDelete(tc);
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
	public List<Student> tcStInsertList(SearchKeyValue skv) {
		return dao.tcStInsertList(skv);
	}
	@Override
	public List<BasicInfo> stdList() {
		return dao.stdList();
	}
	@Override
	public int studentTotal() {
		return dao.studentTotal();
	}
	@Override
	public int searchCount(SearchKeyValue skv) {
		return dao.searchCount(skv);
	}
	
	@Transactional
	@Override
	public String tcInsert(TakeCourse tc) {
		String result = "";
		String oc_id = tc.getOc_id();
		String t_code = tc.getT_code();
		int tc_sale = tc.getTc_sale();
		try {
			for(Student st : tc.getStudents()) {
				TakeCourse temp = new TakeCourse();
				temp.setOc_id(oc_id);
				temp.setT_code(t_code);
				temp.setTc_sale(tc_sale);
				temp.setSt_id(st.getSt_id());
				
				if(dao.tcInsert(temp) < 0) {
					throw new Exception();
				}
			}
			result = "100";
		}catch(Exception e) {
			result = "101";
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public void tcDropInsert(TakeCourse tc) {
		try {
			dao.tcDropInsert(tc);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public void tcDropDelete(TakeCourse tc) {
		try {
			dao.tcDropDelete(tc);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Transactional
	@Override
	public String csInsert(TakeCourse tc) {
		String result = "";
		String cs_date = tc.getCs_date();
		try {
			for(Student st : tc.getStudents()) {
				TakeCourse temp = new TakeCourse();
				temp.setTc_id(st.getTc_id());
				temp.setCs_date(cs_date);
				if(dao.csInsert(temp) < 0) {
					throw new Exception();
				}
			}
			result = "400";
		}catch(Exception e) {
			result = "401";
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String csUpdate(Student st) {
		int temp=0;
		try {
			temp = dao.csUpdate(st);
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
	public String csDelete(Student st) {
		int temp=0;
		try {
			temp = dao.csDelete(st);
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


	

}
