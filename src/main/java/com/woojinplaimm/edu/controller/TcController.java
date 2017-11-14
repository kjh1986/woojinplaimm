package com.woojinplaimm.edu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woojinplaimm.edu.TcService;
import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;
import com.woojinplaimm.edu.model.TakeCourse;

import org.springframework.ui.ModelMap;

//공통적인 부모주소를 지정한다
@Controller
public class TcController {
	
	private Logger logger = LoggerFactory.getLogger(TcController.class);
	
	//MemberService 객체(MemberServiceImpl)에대한 의존주입
	//@Inject는 byType 에의한 의존 주입이 설정된다.
	@Inject
	private TcService service;
	
	@RequestMapping(value="/tcOcList", method = RequestMethod.GET)
	public String tcOcList(HttpServletRequest req, ModelMap model, SearchKeyValue skv) {
		
		String key = req.getParameter("key");
		String value = req.getParameter("value");
		String oc_id = req.getParameter("oc_id");
		
		String temp_oc_id = (String)req.getSession().getAttribute("oc_id");
		if(temp_oc_id !=null && !temp_oc_id.equals("")) {
			oc_id = temp_oc_id;
		}
		req.getSession().setAttribute("oc_id", oc_id);
		
		String std_code = req.getParameter("std_code");
		if(key==null || key.equals("")) {
			key = "all";
			value = "";
		}
		if(std_code==null || std_code.equals("")) {
			std_code = "all";
		}
		if(oc_id== null || oc_id.equals("")) {
			return "oclist";
		}

		String strStartPage = req.getParameter("startPage");
		 
        int startPage = 1;
        int rows = 15;
        
        if(strStartPage != null && !strStartPage.equals("")){
            startPage = Integer.parseInt(strStartPage);
        }
        int startIndex = ((startPage-1)*rows)+1;
		int lastIndex = startPage*rows;
		
		skv.setKey(key);
		skv.setValue(value);
		skv.setOc_id(oc_id);
		skv.setStd_code(std_code);
		skv.setStartIndex(startIndex);
		skv.setLastIndex(lastIndex);
		
		OpenCourse oc = service.courseSearch(skv);
		List<BasicInfo> tcodes = service.tuitionList();		
		List<BasicInfo> stds  = service.stdList();
		
		List<Student> tableData  = service.tcStInsertList(skv);
		int totalCount = service.studentTotal();
		int count = service.searchCount(skv);
		
		int totalPages = count / rows;
		if(count % rows >0) {
			totalPages++;
		}
		
		if(tableData != null && tableData.size() >0) {
			model.addAttribute("tableData", tableData);
			model.addAttribute("tcodes", tcodes);
			model.addAttribute("stds", stds);
			
			model.addAttribute("count", count);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("totalPages", totalPages);
			model.addAttribute("startPage", startPage);
			
			
			model.addAttribute("key", key);
			model.addAttribute("value", value);
			model.addAttribute("oc", oc);
		}

		
		//포워딩
		return "tcoclist";
	}
	
	@RequestMapping(value="/tcStUpdateList", method = RequestMethod.GET)
	public String tcStUpdateList(HttpServletRequest req, ModelMap model, SearchKeyValue skv) {
		
		String oc_id = (String)req.getSession().getAttribute("oc_id");

		logger.info("oc_id : {}" , oc_id);
		
		if(oc_id != null && !oc_id.equals("")) {
			skv.setOc_id(oc_id);
		}
		if(skv.getOc_id()== null || oc_id.equals("")) {
			return "oclist";
		}
		OpenCourse oc = service.courseSearch(skv);
		
		List<Student> tableData = service.tcStUpdateList(oc);
		List<BasicInfo> tcodes = service.tuitionList();
		
		model.addAttribute("tcodes", tcodes);
		model.addAttribute("tableData", tableData);
		model.addAttribute("oc", oc);
		//포워딩
		return "tcstupdatelist";
	}
	
	@RequestMapping(value="/tcCompleteList", method = RequestMethod.GET)
	public String tcStCompleteList(HttpServletRequest req, ModelMap model, SearchKeyValue skv) {
		
		String oc_id = (String)req.getSession().getAttribute("oc_id");

		logger.info("oc_id : {}" , oc_id);
		
		if(oc_id != null && !oc_id.equals("")) {
			skv.setOc_id(oc_id);
		}
		if(skv.getOc_id()== null || oc_id.equals("")) {
			return "oclist";
		}
		OpenCourse oc = service.courseSearch(skv);
		
		List<Student> tableData = service.tcStUpdateList(oc);
		List<BasicInfo> tcodes = service.tuitionList();
		
		model.addAttribute("tcodes", tcodes);
		model.addAttribute("tableData", tableData);
		model.addAttribute("oc", oc);
		//포워딩
		return "tccompletelist";
	}
	
	@RequestMapping(value="/tcInsert", method = RequestMethod.POST)
	public String tcInsert(TakeCourse tc, HttpServletRequest req, RedirectAttributes attr) {
		String[] args = req.getParameterValues("st_id");
		int tc_sale = 0;
		String strtc_sale = req.getParameter("tc_sale");
		if(strtc_sale !=null && !strtc_sale.equals("")) {
			tc_sale = Integer.parseInt(strtc_sale);
		}
		
		
		tc.setTc_sale(tc_sale);
		
		
		List<Student> list = new ArrayList<Student>();
		try {
			for(String str : args) {
				Student st = new Student();
				st.setSt_id(str);
				list.add(st);
			}
		}catch(Exception e) {
			attr.addFlashAttribute("code", "102");
			return "redirect:/tcOcList";
		}
		tc.setStudents(list);
		
		String result = service.tcInsert(tc);
		
		logger.info("dataResult: {}" , result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/tcOcList";
	}

	
	@RequestMapping(value="/tcstUpdate", method = RequestMethod.POST)
	public String tcstUpdate(Student st, RedirectAttributes attr) {
		
		String result = service.tcUpdate(st);

		logger.info("dataResult: {}" , result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/tcStUpdateList";
	}
	
	
	@RequestMapping(value="/tcstDelete", method = RequestMethod.POST)
	public String tcstDelete(TakeCourse tc, RedirectAttributes attr) {
		
		
		String result = service.tcDelete(tc);

		logger.info("dataResult: {}" , result);
		attr.addFlashAttribute("code", result);

		return "redirect:/tcStUpdateList";
	}
	

	@RequestMapping(value="/tcDrop", method = RequestMethod.POST)
	public String tcDrop(OpenCourse oc, HttpServletRequest req, RedirectAttributes attr) {
		
		String tc_id = req.getParameter("tc_id");
		String tc_drop = req.getParameter("tc_drop");
		TakeCourse tc = new TakeCourse();
		tc.setTc_id(tc_id);
		
		if(tc_drop == null || tc_drop.equals("")) {
			service.tcDropInsert(tc);
		}else {
			service.tcDropDelete(tc);
		}
		return "redirect:/tcStUpdateList";
	}
	
	@RequestMapping(value="/csInsert", method = RequestMethod.POST)
	public String csInsert(HttpServletRequest req, RedirectAttributes attr) {
		String[] args = req.getParameterValues("tc_id");
		String cs_date = req.getParameter("cs_date");

		
		TakeCourse tc = new TakeCourse();
		tc.setCs_date(cs_date);
		
		List<Student> list = new ArrayList<Student>();
		try{
			for(String str : args) {
				Student st = new Student();
				st.setTc_id(str);
				list.add(st);
			}
		}catch(Exception e) {
			attr.addFlashAttribute("code", "402");
			return "redirect:/tcCompleteList";
		}
		tc.setStudents(list);
		
		String result = service.csInsert(tc);
		
		logger.info("dataResult: {}" , result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/tcCompleteList";
	}
	
	@RequestMapping(value="/csUpdate", method = RequestMethod.POST)
	public String csUpdate(Student st, RedirectAttributes attr) {
		
		String result = service.csUpdate(st);

		logger.info("dataResult: {}" , result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/tcCompleteList";
	}
	
	@RequestMapping(value="/csDelete", method = RequestMethod.POST)
	public String csDelete(Student st, RedirectAttributes attr) {
		
		
		String result = service.csDelete(st);

		logger.info("dataResult: {}" , result);
		attr.addFlashAttribute("code", result);

		return "redirect:/tcCompleteList";
	}
}