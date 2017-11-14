package com.woojinplaimm.edu.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woojinplaimm.edu.StatsService;
import com.woojinplaimm.edu.model.Stats;

@Controller
public class StatsController {
	
	private Logger logger = LoggerFactory.getLogger(StatsController.class);
	
	//MemberService 객체(MemberServiceImpl)에대한 의존주입
	//@Inject는 byType 에의한 의존 주입이 설정된다.
	@Inject
	private StatsService service;
	//숙소
	@RequestMapping(value="/statsRecord")
	public String statsRecord(HttpServletRequest req, ModelMap model, Stats st) {
		String oc_start_date = req.getParameter("value");
		if(oc_start_date == null||oc_start_date.equals("")) {
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy");
			oc_start_date = format.format(now);
		}
		st.setOc_start_date(oc_start_date);
		
		List<Stats> tableData = service.statsRecord(st);
		logger.info("size: {}", tableData.size());
		int[] chartData2 = new int[12];
		int[] chartData1 = new int[12];
		for(Stats temp : tableData) {
			chartData2[0] += temp.getMon1();
			chartData2[1] += temp.getMon2();
			chartData2[2] += temp.getMon3();
			chartData2[3] += temp.getMon4();
			chartData2[4] += temp.getMon5();
			chartData2[5] += temp.getMon6();
			chartData2[6] += temp.getMon7();
			chartData2[7] += temp.getMon8();
			chartData2[8] += temp.getMon9();
			chartData2[9] += temp.getMon10();
			chartData2[10] += temp.getMon11();
			chartData2[11] += temp.getMon12();
			chartData1[0] += temp.getGoal1();
			chartData1[1] += temp.getGoal2();
			chartData1[2] += temp.getGoal3();
			chartData1[3] += temp.getGoal4();
			chartData1[4] += temp.getGoal5();
			chartData1[5] += temp.getGoal6();
			chartData1[6] += temp.getGoal7();
			chartData1[7] += temp.getGoal8();
			chartData1[8] += temp.getGoal9();
			chartData1[9] += temp.getGoal10();
			chartData1[10] += temp.getGoal11();
			chartData1[11] += temp.getGoal12();
		}
		model.addAttribute("chartData1", chartData1);
		model.addAttribute("chartData2", chartData2);
		model.addAttribute("tableData", tableData);
		
		//포워딩
		return "statsrecord";
	}

	
	
}