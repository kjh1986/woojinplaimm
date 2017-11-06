package com.woojinplaimm.edu;

import java.util.List;

import com.woojinplaimm.edu.model.Company;
import com.woojinplaimm.edu.model.SearchKeyValue;

//MyBatis에서는 추상화를 위해서 interface를 사용한다.
public interface CompanyDAO {

	public List<Company> companyList(SearchKeyValue skv);
	public int companyInsert(Company com)throws Exception;
	public int companyUpdate(Company com)throws Exception;
	public int companyDelete(Company com)throws Exception;
	public int companyTotal();
	public int searchCount(SearchKeyValue skv);
	public Company agreeCheck(Company com);
	public int agreeUpdate(Company com)throws Exception;
	public int agreeInsert(Company com)throws Exception;
	public int companyAgreeDelete(Company com)throws Exception;
	public Company ojCheck(Company com);
	public int ojUpdate(Company com)throws Exception;
	public int ojInsert(Company com)throws Exception;
	public int ojDelete(Company com)throws Exception;
	public int companydefaultInsert(Company com) throws Exception;
	public int companydefaultDelete(Company com) throws Exception;
	public List<Company> companyExcel(SearchKeyValue skv);
	
	
	
}
