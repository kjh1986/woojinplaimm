package com.woojinplaimm.edu;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woojinplaimm.edu.model.Lecturer;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MemberDAO 인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
/* @Repository 어노테이션을 지정해서 스프링 객체로 등록 */
@Repository
public class LecturerDAOImpl implements LecturerDAO {

	// 필수 항목
	// -> 의존 주입 대상
	// -> SqlSessionTemplate 클래스의 객체(데이터베이스 연결 및 종료 담당)
	/* @Inject 어노테이션을 사용하면 byType에 의한 의존 주입이 실행된다. */
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Lecturer> lecturerList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.LecturerMapper.lecturerList",skv);
	}

	@Override
	public int lecturerInsert(Lecturer lec) throws Exception {
		return sqlSession.insert("com.woojinplaimm.edu.LecturerMapper.lecturerInsert",lec);
	}

	@Override
	public int lecturerUpdate(Lecturer lec) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.LecturerMapper.lecturerUpdate",lec);
	}

	@Override
	public int lecturerDelete(Lecturer lec) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.LecturerMapper.lecturerDelete",lec);
	}

	@Override
	public List<Lecturer> insertSubjectList(Lecturer lec) {
		return sqlSession.selectList("com.woojinplaimm.edu.LecturerMapper.insertSubjectList",lec);
	}

	@Override
	public int insertLecsub(Lecturer lec) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.LecturerMapper.insertLecsub",lec);
	}

	@Override
	public List<Lecturer> deleteSubjectList(Lecturer lec) {
		return sqlSession.selectList("com.woojinplaimm.edu.LecturerMapper.deleteSubjectList",lec);
	}

	@Override
	public int deleteLecsub(Lecturer lec) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.LecturerMapper.deleteLecsub",lec);
	}
	


}
