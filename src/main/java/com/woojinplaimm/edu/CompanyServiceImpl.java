package com.woojinplaimm.edu;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MemberService인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
//@Service 어노테이션은 Service 클래스를 Spring 객체로 등록
@Service
public class CompanyServiceImpl implements CompanyService{
	
	//MemberDAO 객체(MemberDAOImpl)에 대한 의존주입 설정 추가
	//@Inject 어노테이션이용(byType에의한 의존주입)
	@Inject
	private CompanyDAO dao;
	public void setDao(CompanyDAO dao) {
		this.dao = dao;
	}
	@Override
	public List<Company> companyList(SearchKeyValue skv) {
		return dao.companyList(skv);
	}
	@Override
	public String companyInsert(Company com) {
		int temp=0;
		try {
			temp = dao.companyInsert(com);
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
	public String companyUpdate(Company com) {
		int temp=0;
		try {
			temp = dao.companyUpdate(com);
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
	public String companyDelete(Company com) {
		int temp=0;
		try {
			temp = dao.companyDelete(com);
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
	public int companyTotal() {
		return dao.companyTotal();
	}
	@Override
	public int searchCount(SearchKeyValue skv) {
		return dao.searchCount(skv);
	}
	@Override
	public Company agreeCheck(Company com) {
		return dao.agreeCheck(com);
	}
	@Override
	public String agreeUpdate(Company com) {
		int temp=0;
		try {
			temp = dao.agreeUpdate(com);
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
	public String agreeInsert(Company com) {
		int temp=0;
		try {
			temp = dao.agreeInsert(com);
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
	public String companyAgreeDelete(Company com) {
		int temp=0;
		try {
			temp = dao.companyAgreeDelete(com);
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
	public Company ojCheck(Company com) {
		return dao.ojCheck(com);
	}
	@Override
	public String ojUpdate(Company com) {
		int temp=0;
		try {
			temp = dao.ojUpdate(com);
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
	public String ojInsert(Company com) {
		int temp=0;
		try {
			temp = dao.ojInsert(com);
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
	public String ojDelete(Company com) {
		int temp=0;
		try {
			temp = dao.ojDelete(com);
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
	public int companydefaultInsert(Company com) {
		int result=0;
		try {
			result = dao.companydefaultInsert(com);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int companydefaultDelete(Company com) {
		int result=0;
		try {
			result = dao.companydefaultDelete(com);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public List<Company> companyExcelList(SearchKeyValue skv) {
		// TODO Auto-generated method stub
		return dao.companyExcel(skv);
	}



}
