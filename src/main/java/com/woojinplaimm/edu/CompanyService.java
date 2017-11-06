package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;

//Spring MVC Framework에서는 추상화를 위해서 interface를 사용한다.
public interface CompanyService {


	public List<Company> companyList(SearchKeyValue skv);
	public String companyInsert(Company com);
	public String companyUpdate(Company com);
	public String companyDelete(Company com);
	public int companyTotal();
	public int searchCount(SearchKeyValue skv);
	public Company agreeCheck(Company com);
	public String agreeUpdate(Company com);
	public String agreeInsert(Company com);
	public String companyAgreeDelete(Company com);
	public Company ojCheck(Company com);
	public String ojUpdate(Company com);
	public String ojInsert(Company com);
	public String ojDelete(Company com);
	public int companydefaultInsert(Company com);
	public int companydefaultDelete(Company com);
	public List<Company> companyExcelList(SearchKeyValue skv);

}
