package com.woojinplaimm.edu;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;

//MemberDAO 인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
/* @Repository 어노테이션을 지정해서 스프링 객체로 등록 */
@Repository
public class StudentDAOImpl implements StudentDAO {

	// 필수 항목
	// -> 의존 주입 대상
	// -> SqlSessionTemplate 클래스의 객체(데이터베이스 연결 및 종료 담당)
	/* @Inject 어노테이션을 사용하면 byType에 의한 의존 주입이 실행된다. */
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Student> studentList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.StudentMapper.studentList",skv);
	}

	@Override
	public int studentInsert(Student st) throws Exception {
		return sqlSession.insert("com.woojinplaimm.edu.StudentMapper.studentInsert",st);
	}

	@Override
	public int studentUpdate(Student st) throws Exception {
		return sqlSession.update("com.woojinplaimm.edu.StudentMapper.studentUpdate",st);
	}

	@Override
	public int studentDelete(Student st) throws Exception {
		return sqlSession.delete("com.woojinplaimm.edu.StudentMapper.studentDelete",st);
	}

	@Override
	public Student studentInfo(Student st) {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.studentInfo",st);
	}

	@Override
	public Student acStudentInfo(Student st) {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.acStudentInfo",st);
	}

	@Override
	public List<Company> companyList() {
		return sqlSession.selectList("com.woojinplaimm.edu.StudentMapper.companyList");
	}

	@Override
	public Student trainStudentInfo(Student st) {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.trainStudentInfo",st);
	}

	@Override
	public int searchCount(SearchKeyValue skv) {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.searchCount",skv);
	}

	@Override
	public int studentTotal() {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.studentTotal");
	}

	@Override
	public String getStdById(Student st) {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.getStdById",st);
	}

	@Override
	public List<Student> stdList() {
		return sqlSession.selectList("com.woojinplaimm.edu.StudentMapper.stdList");
	}

	@Override
	public int studentstdInsert(Student st)  throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.StudentMapper.studentstdInsert",st);
	}

	@Override
	public int studentstdDelete(Student st) throws Exception {
		return sqlSession.delete("com.woojinplaimm.edu.StudentMapper.studentstdDelete",st);
	}

	@Override
	public int studentacUpdate(Student st)  throws Exception{
		return sqlSession.update("com.woojinplaimm.edu.StudentMapper.studentacUpdate",st);
	}

	@Override
	public int studentacInsert(Student st)  throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.StudentMapper.studentacInsert",st);
	}

	@Override
	public Student acCheck(Student st) {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.acCheck",st);
	}

	@Override
	public int studentacDelete(Student st)  throws Exception{
		return sqlSession.delete("com.woojinplaimm.edu.StudentMapper.studentacDelete",st);
	}

	@Override
	public Student trainCheck(Student st) {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.trainCheck",st);
	}

	@Override
	public int studenttrainInsert(Student st)  throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.StudentMapper.studenttrainInsert",st);
	}

	@Override
	public int studenttrainUpdate(Student st)  throws Exception{
		return sqlSession.update("com.woojinplaimm.edu.StudentMapper.studenttrainUpdate",st);
	}

	@Override
	public int studenttrainDelete(Student st)  throws Exception{
		return sqlSession.delete("com.woojinplaimm.edu.StudentMapper.studenttrainDelete",st);
	}

	@Override
	public int pictureAdd(Student st)  throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.StudentMapper.pictureAdd",st);
	}

	@Override
	public String picCheck(Student st) {
		return sqlSession.selectOne("com.woojinplaimm.edu.StudentMapper.picCheck",st);
	}

	

	@Override
	public int pictureUpdate(Student st) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.woojinplaimm.edu.StudentMapper.pictureUpdate",st);
	}

	@Override
	public int pictureDelete(Student st) {
		return sqlSession.delete("com.woojinplaimm.edu.StudentMapper.pictureDelete",st);
		
	}

	@Override
	public List<Student> studentExcelList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.StudentMapper.studentExcelList",skv);
	}
	


}
