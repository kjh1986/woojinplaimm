package com.woojinplaimm.edu.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woojinplaimm.edu.BasicInfoService;
import com.woojinplaimm.edu.model.BasicInfo;
import com.woojinplaimm.edu.model.SearchKeyValue;

@Controller
@RequestMapping("/basicInfo")
public class BasicInfoController {
	private Logger logger = LoggerFactory.getLogger(BasicInfoController.class);
	
	@Inject
	private BasicInfoService service;
	//숙소
	@RequestMapping(value="/roomList", method = RequestMethod.GET)
	public String roomList(ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		
		List<BasicInfo> tableData  = service.roomList(skv);
		String count = String.valueOf(tableData.size());
		
		if(tableData != null && tableData.size() >0) {
			logger.info("dataSize:" + count);
			model.addAttribute("tableData", tableData);
			model.addAttribute("count", count);
		}
		
		//포워딩
		return "roomlist";
	}
	
	@RequestMapping(value="/roomInsert", method = RequestMethod.POST)
	public String roomInsert(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		String result = service.roomInsert(bi);
		
		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/basicInfo/roomList";
	}
	
	@RequestMapping(value="/roomUpdate", method = RequestMethod.POST)
	public String roomUpdate(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.roomUpdate(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/roomList";
	}
	
	@RequestMapping(value="/roomDelete", method = RequestMethod.POST)
	public String roomDelete(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.roomDelete(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/roomList";
	}
	//과목
	@RequestMapping(value="/subjectList", method = RequestMethod.GET)
	public String subjectList(ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		
		List<BasicInfo> tableData  = service.subjectList(skv);
		String count = String.valueOf(tableData.size());
		
		if(tableData != null && tableData.size() >0) {
			logger.info("dataSize:" + count);
			model.addAttribute("tableData", tableData);
			model.addAttribute("count", count);
		}
		
		//포워딩
		return "subjectlist";
	}
	
	@RequestMapping(value="/subjectInsert", method = RequestMethod.POST)
	public String subjectInsert(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.subjectInsert(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/basicInfo/subjectList";
	}
	
	@RequestMapping(value="/subjectUpdate", method = RequestMethod.POST)
	public String subjectUpdate(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		 
		String result = service.subjectUpdate(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/subjectList";
	}
	
	@RequestMapping(value="/subjectDelete", method = RequestMethod.POST)
	public String subjectDelete(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.subjectDelete(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/subjectList";
	}
	
	//과정
	@RequestMapping(value="/courseList", method = RequestMethod.GET)
	public String courseList(ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		
		List<BasicInfo> tableData  = service.courseList(skv);
		String count = String.valueOf(tableData.size());
		
		if(tableData != null && tableData.size() >0) {
			logger.info("dataSize:" + count);
			model.addAttribute("tableData", tableData);
			model.addAttribute("count", count);
		}
		
		//포워딩
		return "courselist";
	}
	
	@RequestMapping(value="/courseInsert", method = RequestMethod.POST)
	public String courseInsert(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.courseInsert(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/basicInfo/courseList";
	}
	
	@RequestMapping(value="/courseUpdate", method = RequestMethod.POST)
	public String courseUpdate(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		 
		String result = service.courseUpdate(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/courseList";
	}
	
	@RequestMapping(value="/courseDelete", method = RequestMethod.POST)
	public String courseDelete(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.courseDelete(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/courseList";
	}
	
	//과정구분
	@RequestMapping(value="/ocdList", method = RequestMethod.GET)
	public String ocdList(ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		
		List<BasicInfo> tableData  = service.ocdList(skv);
		String count = String.valueOf(tableData.size());
		
		if(tableData != null && tableData.size() >0) {
			logger.info("dataSize:" + count);
			model.addAttribute("tableData", tableData);
			model.addAttribute("count", count);
		}
		
		//포워딩
		return "ocdlist";
	}
	
	@RequestMapping(value="/ocdInsert", method = RequestMethod.POST)
	public String ocdInsert(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.ocdInsert(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/basicInfo/ocdList";
	}
	
	@RequestMapping(value="/ocdUpdate", method = RequestMethod.POST)
	public String ocdUpdate(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		 
		String result = service.ocdUpdate(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/ocdList";
	}
	
	@RequestMapping(value="/ocdDelete", method = RequestMethod.POST)
	public String ocdDelete(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.ocdDelete(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/ocdList";
	}
	
	//직종구분
	@RequestMapping(value="/jobList", method = RequestMethod.GET)
	public String jobList(ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		
		List<BasicInfo> tableData  = service.jobList(skv);
		String count = String.valueOf(tableData.size());
		
		if(tableData != null && tableData.size() >0) {
			logger.info("dataSize:" + count);
			model.addAttribute("tableData", tableData);
			model.addAttribute("count", count);
		}
		
		//포워딩
		return "joblist";
	}
	
	@RequestMapping(value="/jobInsert", method = RequestMethod.POST)
	public String jobInsert(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.jobInsert(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/basicInfo/jobList";
	}
	
	@RequestMapping(value="/jobUpdate", method = RequestMethod.POST)
	public String jobUpdate(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		 
		String result = service.jobUpdate(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/jobList";
	}
	
	@RequestMapping(value="/jobDelete", method = RequestMethod.POST)
	public String jobDelete(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.jobDelete(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/jobList";
	}
	
	//훈련비구분
	@RequestMapping(value="/tuitionList", method = RequestMethod.GET)
	public String tuitionList(ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		
		List<BasicInfo> tableData  = service.tuitionList(skv);
		String count = String.valueOf(tableData.size());
		
		if(tableData != null && tableData.size() >0) {
			logger.info("dataSize:" + count);
			model.addAttribute("tableData", tableData);
			model.addAttribute("count", count);
		}
		
		//포워딩
		return "tuitionlist";
	}
	
	@RequestMapping(value="/tuitionInsert", method = RequestMethod.POST)
	public String tuitionInsert(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.tuitionInsert(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/basicInfo/tuitionList";
	}
	
	@RequestMapping(value="/tuitionUpdate", method = RequestMethod.POST)
	public String tuitionUpdate(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		 
		String result = service.tuitionUpdate(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/tuitionList";
	}
	
	@RequestMapping(value="/tuitionDelete", method = RequestMethod.POST)
	public String tuitionDelete(BasicInfo bi, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.tuitionDelete(bi);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/basicInfo/tuitionList";
	}
}
