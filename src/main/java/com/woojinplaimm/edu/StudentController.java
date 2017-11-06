package com.woojinplaimm.edu;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;

import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;

@Controller
public class StudentController {
	
	private Logger logger = LoggerFactory.getLogger(StudentController.class);
	
	//MemberService 객체(MemberServiceImpl)에대한 의존주입
	//@Inject는 byType 에의한 의존 주입이 설정된다.
	@Inject
	private StudentService service;
	
	@RequestMapping(value="/studentList", method = RequestMethod.GET)
	public String studentList(HttpServletRequest req, ModelMap model, SearchKeyValue skv) {
		String key = skv.getKey();
		String std_code=skv.getStd_code();
		
		if(key==null || key.equals("")) {
			key="all";
			skv.setKey("all");
			skv.setValue("");
		}
		if(std_code==null||std_code.equals("")) {
			skv.setStd_code("all");
		}
		String strStartPage = req.getParameter("startPage");
		 
        int startPage = 1;
        int rows = 15;
 
        if(strStartPage != null && !strStartPage.equals("")){
            startPage = Integer.parseInt(strStartPage);
        }
        int startIndex = ((startPage-1)*rows)+1;
		int lastIndex = startPage*rows;
		
        List<Student> stds  = service.stdList();
		skv.setStartIndex(startIndex);
		skv.setLastIndex(lastIndex);
		
		
		List<Student> tableData  = service.studentList(skv);
		int totalCount = service.studentTotal();
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
			model.addAttribute("stds", stds);
			
			model.addAttribute("key", key);
			model.addAttribute("value", skv.getValue());
			model.addAttribute("std_code", std_code);
		}
		
		//포워딩
		return "studentlist";
	}
	
	@RequestMapping(value="/studentInsert", method = RequestMethod.POST)
	public String studentInsert(Student st, HttpServletRequest req, RedirectAttributes attr) {
		String result = service.studentInsert(st);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/studentList";
	}
	
	@RequestMapping(value="/studentUpdate", method = RequestMethod.POST)
	public String studentUpdate(Student st, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.studentUpdate(st);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/studentList";
	}
	
	
	@RequestMapping(value="/studentDelete", method = RequestMethod.POST)
	public String studentDelete(Student st, HttpServletRequest req, RedirectAttributes attr) {
		String oldPicture ="";
		String savePath = req.getServletContext().getRealPath("resources/picture");
		oldPicture = service.picCheck(st);
		if(oldPicture != null && !oldPicture.equals("")) {
			File oldTemp = new java.io.File(String.format("%s//%s", savePath, oldPicture));
			oldTemp.delete();
		}
		String result = service.studentDelete(st);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/studentList";
	}
	
	@RequestMapping(value="/studentInfo", method = RequestMethod.GET)
	public String studentInfo(Student st, ModelMap model, HttpServletRequest req) {
		Student student = null;
		String ajaxPage ="ajaxnonestudentdetail";
		
		logger.info(st.getSt_id());
		String std_code = service.getStdById(st);
		if(std_code ==null || std_code.equals("")) {
			std_code="none";
		}
		
		switch(std_code) {
		case "std-03" :
		case "std-04" :
		case "none" :
			student = service.studentInfo(st);
			List<Student> stds = service.stdList();
			model.addAttribute("stds", stds);
			ajaxPage ="ajaxnonestudentdetail";
			break;
		case "std-01" :
			student = service.trainStudentInfo(st);
			ajaxPage ="ajaxtrainstudentdetail";
			break;
		case "std-02" :
			student = service.acStudentInfo(st);
			List<Company> comids = service.companyList();
			model.addAttribute("comids", comids);
			ajaxPage ="ajaxacstudentdetail";
			break;
		default:
			break;
			
		}
		model.addAttribute("student", student);
		
		return ajaxPage;
	}

	@RequestMapping(value="/studentstdInsert", method = RequestMethod.POST)
	public String studentStdInsert(Student st, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.studentstdInsert(st);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/studentList";
	}

	@RequestMapping(value="/studentacUpdate", method = RequestMethod.POST)
	public String studentacUpdate(Student st, HttpServletRequest req, RedirectAttributes attr) {
		String result="";
		
		Student temp = service.acCheck(st);
		if(temp==null||temp.getSt_id().equals("")) {
			result = service.studentacInsert(st);
		}else {
			result = service.studentacUpdate(st);
		}

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/studentList";
	}

	@RequestMapping(value="/studentacDelete", method = RequestMethod.POST)
	public String studentacDelete(Student st, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.studentacDelete(st);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/studentList";
	}

	@RequestMapping(value="/studenttrainUpdate", method = RequestMethod.POST)
	public String studenttrainUpdate(Student st, HttpServletRequest req, RedirectAttributes attr) {

		String result ="";
		Student temp = service.acCheck(st);
		 
		if(temp==null||temp.getSt_id().equals("")) {
			result = service.studenttrainInsert(st);
		}else {
			result = service.studenttrainUpdate(st);
		}

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/studentList";
	}

	@RequestMapping(value="/studenttrainDelete", method = RequestMethod.POST)
	public String studenttrainDelete(Student st, HttpServletRequest req, RedirectAttributes attr) {
		String result = service.studenttrainDelete(st);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/studentList";
	}
	
	@RequestMapping(value="/studentstdDelete", method = RequestMethod.POST)
	public String studentstdDelete(Student st, HttpServletRequest req, RedirectAttributes attr) {
		String result = service.studentstdDelete(st);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/studentList";
	}
	@RequestMapping(value="/studentPicAdd", method = RequestMethod.POST)
	public String studentPicAdd(MultipartFile pic_fileName, Student st, HttpServletRequest req, RedirectAttributes attr) {
		String result = "1201";
		String savePath = req.getServletContext().getRealPath("resources/picture");
		System.out.println(savePath);
		logger.info("originalName: {}" , pic_fileName.getOriginalFilename());
		logger.info("filesize: {}" , pic_fileName.getSize());
		try {
			if(!pic_fileName.getContentType().startsWith("image")) {
				throw new Exception();
			}
			
			String newFilename = uploadFile(savePath, pic_fileName.getOriginalFilename(), pic_fileName.getBytes());

			String oldPicture = service.picCheck(st);
			if(oldPicture == null||oldPicture.equals("")) {
				st.setPic_filename(newFilename);
				result = service.pictureAdd(st);
			}else {
				File oldTemp = new java.io.File(String.format("%s//%s", savePath, oldPicture));
				oldTemp.delete();
				st.setPic_filename(newFilename);
				result = service.pictureUpdate(st);
			}
		}catch(Exception e) {
			result = "1201";
			e.printStackTrace();
		}
		
		attr.addFlashAttribute("code", result);
		return "redirect:/studentList";
	}

	private String uploadFile(String savePath, String originalFilename, byte[] bytes) throws Exception{
		UUID uid = UUID.randomUUID();
		String newFilename = uid.toString()+"_"+originalFilename;
		System.out.println(newFilename);
		File target = new File(savePath, newFilename);
		System.out.println(target.getName());
		System.out.println(target.isDirectory());
		
		FileCopyUtils.copy(bytes, target);
		logger.info("success uploadFile");
		return newFilename;
	}
	
	
	@RequestMapping(value="/studentExcel", method = RequestMethod.POST)
	public String studentExcel(HttpServletResponse response, ModelMap model, SearchKeyValue skv) {
		String key = skv.getKey();
		String std_code=skv.getStd_code();
		logger.info("key : {}",key);
		logger.info("std_code : {}",std_code);
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		if(std_code==null||std_code.equals("")) {
			skv.setStd_code("all");
		}
		
		List<Student> stList  = service.studentExcelList(skv);

		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet spreadsheet = workbook.createSheet("훈련생목록");
		XSSFRow row;
		
		Map<String, Object[]> stinfo = new TreeMap<String, Object[]>();
		int i =1;
		
		stinfo.put(String.valueOf(i), new Object[] {"번호", "구분번호", "구분명" ,"훈련생명" ,"주민번호","생년월일","나이","전화번호","이메일","차량번호" 
				,"등록일","관리번호","학력","자격증","주소", "희망지역", "희망급여",
				 "사업자번호", "회사명", "부서명", "직위명", "사번", "회사전화번호","비고"});
		
		for(Student st : stList) {
			i++;
			stinfo.put(String.valueOf(i), new Object[] {st.getSt_id(),st.getStd_code(),st.getStd_name(),st.getSt_name()
					,st.getSt_ssn(),st.getSt_birth(),st.getSt_age(),st.getSt_tel(),st.getSt_email(),st.getSt_carnum()
					,st.getSt_regdate(),st.getManagement_id(),st.getSt_eduback(),st.getSt_license()
					,st.getSt_addr(),st.getHope_location(),st.getHope_pay(),st.getCom_id(),st.getCom_name(),st.getAc_st_dept(),st.getJob_title()
					,st.getEmp_id(),st.getCom_tel(),st.getSt_note()});
			
		}
		/*st_id std_code std_name st_name st_ssn st_birth st_age st_tel st_email st_carnum 
		st_regdate pic_filename st_note management_id st_eduback st_license
		st_addr hope_location hope_pay com_id com_name ac_st_dept job_title
		emp_id com_tel*/
		Set<String> keyid = stinfo.keySet();
		int rowid = 0;
		for (String skey : keyid) {
			row = spreadsheet.createRow(rowid++);
			Object[] objectArr = stinfo.get(skey);
			int cellid = 0;
			for (Object obj : objectArr) {
				Cell cell = row.createCell(cellid++);
				cell.setCellValue((String) obj);
			}
		}
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = formatter.format(now);
		response.setHeader("Content-disposition","attachment;filename=" +date+ "studentlist.xlsx");
	    response.setHeader("Content-Type", "application/vnd.ms-excel; charset=MS949");
	    response.setHeader("Content-Description", "JSP Generated Data"); 
	    response.setHeader("Content-Transfer-Encoding", "binary;"); 
	    response.setHeader("Pragma", "no-cache;"); 
	    response.setHeader("Expires", "-1;");
	    
	    ServletOutputStream out;
		try {
			out = response.getOutputStream();
			workbook.write(out);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//포워딩
		return null;
	}
	
	
}