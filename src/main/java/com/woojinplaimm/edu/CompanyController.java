package com.woojinplaimm.edu;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;
import com.woojinplaimm.edu.model.Student;

import org.springframework.ui.ModelMap;

//공통적인 부모주소를 지정한다
@Controller
public class CompanyController {
	
	private Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	//MemberService 객체(MemberServiceImpl)에대한 의존주입
	//@Inject는 byType 에의한 의존 주입이 설정된다.
	@Inject
	private CompanyService service;
	@RequestMapping(value="/companyList", method = RequestMethod.GET)
	public String companyList(HttpServletRequest req, ModelMap model, SearchKeyValue skv) {
		
		String key = skv.getKey();
		if(key==null || key.equals("")) {
			skv.setKey(key);
			skv.setValue("");
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
		
		
		List<Company> tableData  = service.companyList(skv);
		int totalCount = service.companyTotal();
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
			
			model.addAttribute("key", key);
			model.addAttribute("value", skv.getValue());
		}
		
		//포워딩
		return "companylist";
	}
	
	@RequestMapping(value="/companyInsert", method = RequestMethod.POST)
	public String companyInsert(Company com, HttpServletRequest req, RedirectAttributes attr) {
		String result = service.companyInsert(com);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		return "redirect:/companyList";
	}
	
	@RequestMapping(value="/companyUpdate", method = RequestMethod.POST)
	public String companyUpdate(Company com, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.companyUpdate(com);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/companyList";
	}
	
	
	@RequestMapping(value="/companyDelete", method = RequestMethod.POST)
	public String companyDelete(Company com, HttpServletRequest req, RedirectAttributes attr) {
		
		
		String result = service.companyDelete(com);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/companyList";
	}
	
	@RequestMapping(value="/companyDefault", method = RequestMethod.POST)
	public String companyDefault(Company com, HttpServletRequest req, RedirectAttributes attr) {
		
		String com_dc = req.getParameter("com_dc");
		
		if(com_dc == null || com_dc.equals("")) {
			service.companydefaultInsert(com);
			
		}else {
			service.companydefaultDelete(com);
		}
		
		
		return "redirect:/companyList";
	}
	@RequestMapping(value="/companyAgree", method = RequestMethod.POST)
	public String companyAgree(Company com, HttpServletRequest req, RedirectAttributes attr) {
		
		String result ="";
		Company temp = service.agreeCheck(com);
		
		if(temp == null || temp.getCom_id().equals("")) {
			result = service.agreeInsert(com);
		}else {
			result = service.agreeUpdate(com);
		}

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		
		return "redirect:/companyList";
	}
	@RequestMapping(value="/companyAgreeDelete", method = RequestMethod.POST)
	public String companyAgreeDelete(Company com, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.companyAgreeDelete(com);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/companyList";
		
	}
	@RequestMapping(value="/companyOj", method = RequestMethod.POST)
	public String companyOj(Company com, HttpServletRequest req, RedirectAttributes attr) {
		String result ="";
		Company temp = service.ojCheck(com);
		
		if(temp == null || temp.getCom_id().equals("")) {
			result = service.ojInsert(com);
		}else {
			result = service.ojUpdate(com);
		}
		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/companyList";
		
	}
	@RequestMapping(value="/companyOjDelete", method = RequestMethod.POST)
	public String companyOjDelete(Company com, HttpServletRequest req, RedirectAttributes attr) {
		
		String result = service.ojDelete(com);

		logger.info("dataResult: {}" ,result);
		attr.addFlashAttribute("code", result);
		
		return "redirect:/companyList";
	}
	
	@RequestMapping(value="/companyExcel", method = RequestMethod.POST)
	public String companyExcel(HttpServletResponse response, ModelMap model, SearchKeyValue skv) {
		String key = skv.getKey();
		logger.info("key : {}",key);
		if(key==null || key.equals("")) {
			skv.setKey("all");
			skv.setValue("");
		}
		
		List<Company> comList  = service.companyExcelList(skv);

		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet spreadsheet = workbook.createSheet("협약기업목록");
		XSSFRow row;
		
		Map<String, Object[]> cominfo = new TreeMap<String, Object[]>();
		int i =1;
		
		cominfo.put(String.valueOf(i), new Object[] { "사업자번호", "회사명", "전화번호", "고용보험번호", "사원수", "대표자명"
				, "우편번호", "주소", "업종", "상세업종", "체납여부", "온라인가입일", "협약일", "갱신일", "취소일", "비고"});
		
		for(Company com : comList) {
			i++;
			cominfo.put(String.valueOf(i), new Object[] {com.getCom_id(), com.getCom_name(), com.getCom_tel(), com.getCom_inurance_id()
					,String.valueOf(com.getCom_empnum()), com.getCom_ceo_name(), com.getCom_postnum(),com.getCom_addr()
					,com.getCom_type_biz(),com.getCom_type_biz_detail(), com.getOj_date(),com.getAc_date(), com.getAc_renew_date(), com.getAc_cancel_date(),com.getCom_note()});
			
		}
		/**/
		Set<String> keyid = cominfo.keySet();
		int rowid = 0;
		for (String skey : keyid) {
			row = spreadsheet.createRow(rowid++);
			Object[] objectArr = cominfo.get(skey);
			int cellid = 0;
			for (Object obj : objectArr) {
				Cell cell = row.createCell(cellid++);
				cell.setCellValue((String) obj);
			}
		}
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = formatter.format(now);
		response.setHeader("Content-disposition","attachment;filename=" +date+ "companylist.xlsx");
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