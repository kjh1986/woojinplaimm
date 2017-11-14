package com.woojinplaimm.edu.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woojinplaimm.edu.OcService;
import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.OpenCourse;
import com.woojinplaimm.edu.model.SearchKeyValue;

import org.springframework.ui.ModelMap;

//공통적인 부모주소를 지정한다
@Controller
public class OcController {
	
	private Logger logger = LoggerFactory.getLogger(OcController.class);
	
	//MemberService 객체(MemberServiceImpl)에대한 의존주입
	//@Inject는 byType 에의한 의존 주입이 설정된다.
	@Inject
	private OcService service;
	//숙소
	@RequestMapping(value="/ocList", method = RequestMethod.GET)
	public String ocList(HttpServletRequest req, ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		String ing = skv.getIng();
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		if(ing==null || ing.equals("")) {
			skv.setIng("all");
		}

		String strStartPage = req.getParameter("startPage");
		 
        int startPage = 1;
        int rows = 15;
 
        if(strStartPage != null && !strStartPage.equals("")){
            startPage = Integer.parseInt(strStartPage);
        }
        int startIndex = ((startPage-1)*rows)+1;
		int lastIndex = startPage*rows;
		
		
		skv.setStartIndex(startIndex);
		skv.setLastIndex(lastIndex);
		
		List<OpenCourse> tableData  = service.ocList(skv);
		int totalCount = service.ocTotal();
		int count = service.searchCount(skv);
		
		int totalPages = count / rows;
		if(count % rows >0) {
			totalPages++;
		}
		
		if(tableData != null && tableData.size() >0) {
			model.addAttribute("tableData", tableData);
			model.addAttribute("count", count);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("totalPages", totalPages);
			model.addAttribute("startPage", startPage);
			
			
			model.addAttribute("key", skv.getKey());
			model.addAttribute("value", skv.getValue());
			model.addAttribute("ing", skv.getIng());
		}

		List<BasicInfo> ocds = service.ocdList();
		List<BasicInfo> jfs = service.jfList();
		List<BasicInfo> courses = service.courseList();
		List<BasicInfo> subjects = service.subjectList();
		model.addAttribute("ocds", ocds);
		model.addAttribute("jfs", jfs);
		model.addAttribute("courses", courses);
		model.addAttribute("subjects", subjects);
		
		//포워딩
		return "oclist";
	}
	
	@RequestMapping(value="/ocInsert", method = RequestMethod.POST)
	public String ocInsert(OpenCourse oc, RedirectAttributes attr) {
		String result = service.ocInsert(oc);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/ocList";
	}
	
	@RequestMapping(value="/ocUpdate", method = RequestMethod.POST)
	public String ocUpdate(OpenCourse oc, RedirectAttributes attr) {
		
		String result = service.ocUpdate(oc);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/ocList";
	}
	
	
	@RequestMapping(value="/ocDelete", method = RequestMethod.POST)
	public String ocDelete(OpenCourse oc, RedirectAttributes attr) {
		
		
		String result = service.ocDelete(oc);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/ocList";
	}
	
	@RequestMapping(value="/ocOsLecList", method = RequestMethod.GET)
	public @ResponseBody List<BasicInfo> ocOsLecList(BasicInfo bi, ModelMap model) {
		
		List<BasicInfo> result = service.ocOsLecList(bi);
		
		return result;
	}
	@RequestMapping(value="/ocInfo", method = RequestMethod.GET)
	public String ocInfo(OpenCourse oc, ModelMap model) {
		OpenCourse result = service.ocInfo(oc);
		List<BasicInfo> ocds = service.ocdList();
		List<BasicInfo> jfs = service.jfList();
		List<BasicInfo> courses = service.courseList();

		model.addAttribute("oc", result);
		model.addAttribute("ocds", ocds);
		model.addAttribute("jfs", jfs);
		model.addAttribute("courses", courses);
		
		return "ajaxocdetail";
	}

	@RequestMapping(value="/ocOsInsert", method = RequestMethod.POST)
	public String ocOsInsert(OpenCourse oc, RedirectAttributes attr) {
		String result = service.ocOsInsert(oc);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/ocList";
	}
	
	@RequestMapping(value="/ocOsDeleteList", method = RequestMethod.GET)
	public @ResponseBody List<OpenCourse> ocOsDeleteList(OpenCourse oc, ModelMap model) {
		
		List<OpenCourse> lecsubs  = service.ocOsDeleteList(oc);
		
		return lecsubs;
	}
	
	@RequestMapping(value="/ocOsDelete", method = RequestMethod.POST)
	public String ocOsDelete(OpenCourse oc, RedirectAttributes attr) {
		
		
		String result = service.ocOsDelete(oc);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/ocList";
	}
	
	
	
}