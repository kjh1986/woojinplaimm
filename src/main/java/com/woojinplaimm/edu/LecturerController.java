package com.woojinplaimm.edu;

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

import com.woojinplaimm.edu.model.Lecturer;
import com.woojinplaimm.edu.model.SearchKeyValue;

import org.springframework.ui.ModelMap;

//공통적인 부모주소를 지정한다
@Controller
public class LecturerController {
	
	private Logger logger = LoggerFactory.getLogger(LecturerController.class);
	
	//MemberService 객체(MemberServiceImpl)에대한 의존주입
	//@Inject는 byType 에의한 의존 주입이 설정된다.
	@Inject
	private LecturerService service;
	//숙소
	@RequestMapping(value="/lecturerList", method = RequestMethod.GET)
	public String lecturerList(ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		if(key==null || key.equals("")) {
			skv.setKey(key);
			skv.setValue("");
		}
		
		List<Lecturer> tableData  = service.lecturerList(skv);
		String count = String.valueOf(tableData.size());
		
		if(tableData != null && tableData.size() >0) {
			logger.info("dataSize:" + count);
			model.addAttribute("tableData", tableData);
			model.addAttribute("count", count);
		}
		
		//포워딩
		return "lecturerlist";
	}
	
	@RequestMapping(value="/lecturerInsert", method = RequestMethod.POST)
	public String lecturerInsert(Lecturer lec, HttpServletRequest req, RedirectAttributes attr) {
		String result = service.lecturerInsert(lec);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/lecturerList";
	}
	
	@RequestMapping(value="/lecturerUpdate", method = RequestMethod.POST)
	public String lecturerUpdate(Lecturer lec, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.lecturerUpdate(lec);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/lecturerList";
	}
	
	@RequestMapping(value="/lecturerDelete", method = RequestMethod.POST)
	public String lecturerDelete(Lecturer lec, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.lecturerDelete(lec);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/lecturerList";
	}
	
	
	@RequestMapping(value="/insertSubjectList", method = RequestMethod.GET)
	public @ResponseBody List<Lecturer> insertSubjectList(Lecturer lec, HttpServletRequest req, RedirectAttributes attr) {
		
		List<Lecturer> subList = service.insertSubjectList(lec);
		
		return subList;
	}
	
	@RequestMapping(value="/deleteSubjectList", method = RequestMethod.GET)
	public @ResponseBody List<Lecturer> deleteSubjectList(Lecturer lec, HttpServletRequest req, RedirectAttributes attr) {
		
		List<Lecturer> subList = service.deleteSubjectList(lec);
		
		return subList;
	}
	
	@RequestMapping(value="/insertLecsub", method = RequestMethod.POST)
	public String insertLecsub(Lecturer lec, HttpServletRequest req, RedirectAttributes attr) {
		String result = service.insertLecsub(lec);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/lecturerList";
	}
	
	@RequestMapping(value="/deleteLecsub", method = RequestMethod.POST)
	public String deleteLecsub(Lecturer lec, HttpServletRequest req, RedirectAttributes attr) {
		String result = service.deleteLecsub(lec);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/lecturerList";
	}


}