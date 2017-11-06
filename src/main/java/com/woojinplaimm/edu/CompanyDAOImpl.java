package com.woojinplaimm.edu;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MemberDAO 인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
/* @Repository 어노테이션을 지정해서 스프링 객체로 등록 */
@Repository
public class CompanyDAOImpl implements CompanyDAO {

	// 필수 항목
	// -> 의존 주입 대상
	// -> SqlSessionTemplate 클래스의 객체(데이터베이스 연결 및 종료 담당)
	/* @Inject 어노테이션을 사용하면 byType에 의한 의존 주입이 실행된다. */
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Company> companyList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.CompanyMapper.companyList", skv);
	}

	@Override
	public int companyInsert(Company com) throws Exception {
		return sqlSession.insert("com.woojinplaimm.edu.CompanyMapper.companyInsert", com);
	}

	@Override
	public int companyUpdate(Company com) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.CompanyMapper.companyUpdate", com);
	}

	@Override
	public int companyDelete(Company com) throws Exception {
		return sqlSession.delete("com.woojinplaimm.edu.CompanyMapper.companyDelete", com);
	}

	@Override
	public int companyTotal() {
		return sqlSession.selectOne("com.woojinplaimm.edu.CompanyMapper.companyTotal");
	}

	@Override
	public int searchCount(SearchKeyValue skv) {
		return sqlSession.selectOne("com.woojinplaimm.edu.CompanyMapper.companyTotal",skv);
	}

	@Override
	public int companydefaultInsert(Company com) throws Exception {
		return sqlSession.insert("com.woojinplaimm.edu.CompanyMapper.companydefaultInsert",com);
	}
	@Override
	public int companydefaultDelete(Company com) throws Exception {
		return sqlSession.delete("com.woojinplaimm.edu.CompanyMapper.companydefaultDelete",com);
	}

	@Override
	public Company agreeCheck(Company com) {
		return sqlSession.selectOne("com.woojinplaimm.edu.CompanyMapper.agreeCheck",com);
	}

	@Override
	public int agreeUpdate(Company com) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.CompanyMapper.agreeUpdate",com);
	}

	@Override
	public int agreeInsert(Company com) throws Exception {
		return sqlSession.insert("com.woojinplaimm.edu.CompanyMapper.agreeInsert",com);
	}

	@Override
	public int companyAgreeDelete(Company com) throws Exception {
		return sqlSession.delete("com.woojinplaimm.edu.CompanyMapper.companyAgreeDelete",com);
	}

	@Override
	public Company ojCheck(Company com) {
		return sqlSession.selectOne("com.woojinplaimm.edu.CompanyMapper.ojCheck",com);
	}

	@Override
	public int ojUpdate(Company com) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.CompanyMapper.ojUpdate",com);
	}

	@Override
	public int ojInsert(Company com) throws Exception {
		return sqlSession.insert("com.woojinplaimm.edu.CompanyMapper.ojInsert",com);
	}

	@Override
	public int ojDelete(Company com) throws Exception {
		return sqlSession.delete("com.woojinplaimm.edu.CompanyMapper.ojDelete",com);
	}

	@Override
	public List<Company> companyExcel(SearchKeyValue skv) {
		
		return sqlSession.selectList("com.woojinplaimm.edu.CompanyMapper.companyExcel", skv);
	}
	

}
