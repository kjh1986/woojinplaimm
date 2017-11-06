package com.woojinplaimm.edu;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.woojinplaimm.edu.model.Stats;

//MemberService인터페이스에 대한 구현 클래스
//-> 추상 메소드에 대한 구현 필수
//@Service 어노테이션은 Service 클래스를 Spring 객체로 등록
@Service
public class StatsServiceImpl implements StatsService{
	
	//MemberDAO 객체(MemberDAOImpl)에 대한 의존주입 설정 추가
	//@Inject 어노테이션이용(byType에의한 의존주입)
	@Inject
	private StatsDAO dao;
	public void setDao(StatsDAO dao) {
		this.dao = dao;
	}
	@Override
	public List<Stats> statsRecord(Stats st) {
		// TODO Auto-generated method stub
		return dao.statsRecord(st);
	}

	

}
