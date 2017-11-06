package com.woojinplaimm.edu;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.SearchKeyValue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class WoojinDAOTest {

	@Inject
	private BasicInfoDAO dao;
	
	@Test
	public void testRoomList()throws Exception{
		SearchKeyValue skv = new SearchKeyValue();
		skv.setKey("room_name");
		skv.setValue("2");
		List<BasicInfo> list = dao.roomList(skv);
		for(BasicInfo bi : list) {
			System.out.printf("%s %s %s%n",bi.getRoom_id(), bi.getRoom_name(), bi.getRoom_limit(), bi.getRoom_count());
		}
	
		
	}	

}


