package com.woojinplaimm.edu;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;
import com.woojinplaimm.edu.model.TakeCourse;

//MemberDAO 인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
/* @Repository 어노테이션을 지정해서 스프링 객체로 등록 */
@Repository
public class TcDAOImpl implements TcDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public OpenCourse courseSearch(SearchKeyValue skv) {
		return sqlSession.selectOne("com.woojinplaimm.edu.TcMapper.courseSearch",skv);
	}

	@Override
	public List<Student> tcStUpdateList(OpenCourse oc) {
		return sqlSession.selectList("com.woojinplaimm.edu.TcMapper.tcStUpdateList",oc);
	}

	@Override
	public List<BasicInfo> tuitionList() {
		return sqlSession.selectList("com.woojinplaimm.edu.TcMapper.tuitionList");
	}

	@Override
	public int tcUpdate(Student st) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.TcMapper.tcUpdate", st);
	}

	@Override
	public int tcDelete(TakeCourse tc) throws Exception {
		return sqlSession.delete("com.woojinplaimm.edu.TcMapper.tcDelete", tc);
	}

	@Override
	public List<Student> tcStInsertList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.TcMapper.tcStInsertList", skv);
	}

	@Override
	public List<BasicInfo> stdList() {
		return sqlSession.selectList("com.woojinplaimm.edu.TcMapper.stdList");
	}

	@Override
	public int studentTotal() {
		return sqlSession.selectOne("com.woojinplaimm.edu.TcMapper.studentTotal");
	}

	@Override
	public int searchCount(SearchKeyValue skv) {
		return sqlSession.selectOne("com.woojinplaimm.edu.TcMapper.searchCount", skv);
	}

	@Override
	public int tcInsert(TakeCourse tc) throws Exception {
		
		return sqlSession.insert("com.woojinplaimm.edu.TcMapper.tcInsert", tc);
	}

	@Override
	public void tcDropInsert(TakeCourse tc) {
		sqlSession.insert("com.woojinplaimm.edu.TcMapper.tcDropInsert", tc);
	}

	@Override
	public void tcDropDelete(TakeCourse tc) {
		sqlSession.delete("com.woojinplaimm.edu.TcMapper.tcDropDelete", tc);
		
	}

	@Override
	public int csInsert(TakeCourse tc) {
		
		return sqlSession.insert("com.woojinplaimm.edu.TcMapper.csInsert", tc);
	}

	@Override
	public int csUpdate(Student st) {
		return sqlSession.update("com.woojinplaimm.edu.TcMapper.csUpdate", st);
	}

	@Override
	public int csDelete(Student st) {
		return sqlSession.delete("com.woojinplaimm.edu.TcMapper.csDelete", st);
	}






}
