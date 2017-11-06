package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.Stats;

//MyBatis에서는 추상화를 위해서 interface를 사용한다.
public interface StatsDAO {
	
	public List<Stats> statsRecord(Stats st);
	
}
