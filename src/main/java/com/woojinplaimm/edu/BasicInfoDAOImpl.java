package com.woojinplaimm.edu;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.SearchKeyValue;

@Repository
public class BasicInfoDAOImpl implements BasicInfoDAO{

	@Inject
	private SqlSession sqlSession;
	
	//숙소-------------------------------------------------------------------------------
	@Override
	public List<BasicInfo> roomList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.BasicInfoMapper.roomList", skv);
	}

	@Override
	public int roomInsert(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.roomInsert", bi);
	}

	@Override
	public int roomUpdate(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.roomUpdate", bi);
	}

	@Override
	public int roomDelete(BasicInfo bi) throws Exception {
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.roomDelete", bi);
	}

	//과목-------------------------------------------------------------------------------
	@Override
	public List<BasicInfo> subjectList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.BasicInfoMapper.subjectList", skv);
	}

	@Override
	public int subjectInsert(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.subjectInsert", bi);
	}

	@Override
	public int subjectUpdate(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.subjectUpdate", bi);
	}

	@Override
	public int subjectDelete(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.subjectDelete", bi);
	}
	
	//과정-------------------------------------------------------------------------------

	@Override
	public List<BasicInfo> courseList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.BasicInfoMapper.courseList", skv);
	}

	@Override
	public int courseInsert(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.courseInsert", bi);
	}

	@Override
	public int courseUpdate(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.courseUpdate", bi);
	}

	@Override
	public int courseDelete(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.courseDelete", bi);
	}
	
	//과정구분---------------------------------------------------------------------------

	@Override
	public List<BasicInfo> ocdList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.BasicInfoMapper.ocdList", skv);
	}

	@Override
	public int ocdInsert(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.ocdInsert", bi);
	}

	@Override
	public int ocdUpdate(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.ocdUpdate", bi);
	}

	@Override
	public int ocdDelete(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.ocdDelete", bi);
	}
	
	//직종구분-------------------------------------------------------------------------------

	@Override
	public List<BasicInfo> jobList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.BasicInfoMapper.jobList", skv);
	}

	@Override
	public int jobInsert(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.jobInsert", bi);
	}

	@Override
	public int jobUpdate(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.jobUpdate", bi);
	}

	@Override
	public int jobDelete(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.jobDelete", bi);
	}
	
	//훈련비구분-------------------------------------------------------------------------------

	@Override
	public List<BasicInfo> tuitionList(SearchKeyValue skv) {
		return sqlSession.selectList("com.woojinplaimm.edu.BasicInfoMapper.tuitionList", skv);
	}

	@Override
	public int tuitionInsert(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.tuitionInsert", bi);
	}

	@Override
	public int tuitionUpdate(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.tuitionUpdate", bi);
	}

	@Override
	public int tuitionDelete(BasicInfo bi) throws Exception{
		return sqlSession.insert("com.woojinplaimm.edu.BasicInfoMapper.tuitionDelete", bi);
	}

}
