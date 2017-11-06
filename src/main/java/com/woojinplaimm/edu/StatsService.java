package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.Stats;

//Spring MVC Framework에서는 추상화를 위해서 interface를 사용한다.
public interface StatsService {

	public List<Stats> statsRecord(Stats st);

}
