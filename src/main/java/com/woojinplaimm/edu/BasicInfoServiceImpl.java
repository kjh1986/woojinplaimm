package com.woojinplaimm.edu;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.SearchKeyValue;

@Service
public class BasicInfoServiceImpl implements BasicInfoService{

	@Inject
	private BasicInfoDAO dao;
	public void setDao(BasicInfoDAO dao) {
		this.dao = dao;
	}
	
	//숙소---------------------------------------------------------------------
	@Override
	public List<BasicInfo> roomList(SearchKeyValue skv) {
		return dao.roomList(skv);
	}

	@Override
	public String roomInsert(BasicInfo bi) {
		int temp = 0;
		try {
			temp = dao.roomInsert(bi);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		String result = "101";
		if(temp > 0) {
			result = "100";
		}
		return result;
	}

	@Override
	public String roomUpdate(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.roomUpdate(bi);
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
	public String roomDelete(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.roomDelete(bi);
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
	//과목---------------------------------------------------------------------

	@Override
	public List<BasicInfo> subjectList(SearchKeyValue skv) {
		return dao.subjectList(skv);
	}

	@Override
	public String subjectInsert(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.subjectInsert(bi);
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
	public String subjectUpdate(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.subjectUpdate(bi);
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
	public String subjectDelete(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.subjectDelete(bi);
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
	//과정---------------------------------------------------------------------

	@Override
	public List<BasicInfo> courseList(SearchKeyValue skv) {
		return dao.courseList(skv);
	}

	@Override
	public String courseInsert(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.courseInsert(bi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String result = "101";
		if(temp > 0) {
			result = "100";
		}
		return result;
	}

	@Override
	public String courseUpdate(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.courseUpdate(bi);
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
	public String courseDelete(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.courseDelete(bi);
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
	
	//과정구분---------------------------------------------------------------------
	@Override
	public List<BasicInfo> ocdList(SearchKeyValue skv) {
		return dao.ocdList(skv);
	}

	@Override
	public String ocdInsert(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.ocdInsert(bi);
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
	public String ocdUpdate(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.ocdUpdate(bi);
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
	public String ocdDelete(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.ocdDelete(bi);
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

	//직종구분---------------------------------------------------------------------
	@Override
	public List<BasicInfo> jobList(SearchKeyValue skv) {
		return dao.jobList(skv);
	}

	@Override
	public String jobInsert(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.jobInsert(bi);
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
	public String jobUpdate(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.jobUpdate(bi);
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
	public String jobDelete(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.jobDelete(bi);
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

	//훈련비구분---------------------------------------------------------------------
	@Override
	public List<BasicInfo> tuitionList(SearchKeyValue skv) {
		return dao.tuitionList(skv);
	}

	@Override
	public String tuitionInsert(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.tuitionInsert(bi);
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
	public String tuitionUpdate(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.tuitionUpdate(bi);
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
	public String tuitionDelete(BasicInfo bi) {
		int temp=0;
		try {
			temp = dao.tuitionDelete(bi);
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

}
