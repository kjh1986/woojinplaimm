package com.woojinplaimm.edu;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MemberDAO 인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
/* @Repository 어노테이션을 지정해서 스프링 객체로 등록 */
@Repository
public class OcDAOImpl implements OcDAO {

	// 필수 항목
	// -> 의존 주입 대상
	// -> SqlSessionTemplate 클래스의 객체(데이터베이스 연결 및 종료 담당)
	/* @Inject 어노테이션을 사용하면 byType에 의한 의존 주입이 실행된다. */
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<OpenCourse> ocList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.OcMapper.ocList",skv);
	}

	@Override
	public int ocInsert(OpenCourse oc) throws Exception {
		return sqlSession.insert("com.woojinplaimm.edu.OcMapper.ocInsert",oc);
	}

	@Override
	public int ocUpdate(OpenCourse oc) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.OcMapper.ocUpdate",oc);
	}

	@Override
	public int ocDelete(OpenCourse oc) throws Exception {
		return sqlSession.delete("com.woojinplaimm.edu.OcMapper.ocDelete",oc);
	}

	@Override
	public int ocTotal() {
		return sqlSession.selectOne("com.woojinplaimm.edu.OcMapper.ocTotal");
	}

	@Override
	public int searchCount(SearchKeyValue skv) {
		return sqlSession.selectOne("com.woojinplaimm.edu.OcMapper.searchCount", skv);
	}

	@Override
	public OpenCourse ocInfo(OpenCourse oc) {
		return sqlSession.selectOne("com.woojinplaimm.edu.OcMapper.ocInfo",oc);
	}

	@Override
	public List<BasicInfo> ocdList() {
		return sqlSession.selectList("com.woojinplaimm.edu.OcMapper.ocdList");
	}

	@Override
	public List<BasicInfo> jfList() {
		return sqlSession.selectList("com.woojinplaimm.edu.OcMapper.jfList");
	}

	@Override
	public List<BasicInfo> courseList() {
		return sqlSession.selectList("com.woojinplaimm.edu.OcMapper.courseList");
	}

	@Override
	public List<BasicInfo> subjectList() {
		return sqlSession.selectList("com.woojinplaimm.edu.OcMapper.subjectList");
	}

	@Override
	public List<BasicInfo> ocOsLecList(BasicInfo bi) {
		return sqlSession.selectList("com.woojinplaimm.edu.OcMapper.ocOsLecList",bi);
	}

	@Override
	public int ocOsInsert(OpenCourse os) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.OcMapper.ocOsInsert",os);
	}

	@Override
	public List<OpenCourse> ocOsDeleteList(OpenCourse oc) {
		return sqlSession.selectList("com.woojinplaimm.edu.OcMapper.ocOsDeleteList",oc);
	}

	@Override
	public int ocOsDelete(OpenCourse os) throws Exception{
		return sqlSession.delete("com.woojinplaimm.edu.OcMapper.ocOsDelete",os);
	}




}
