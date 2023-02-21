package com.naedam.admin.common;

import java.io.Serializable;

import lombok.Data;

@Data
public class Comm  implements Serializable{
	
	///Field
	private int currentPage;
	private String searchCondition;
	public String searchKeyword;
	private String searchType;
	private int searchSort;
	private int pageSize;
	private int endRowNum;
	private int startRowNum;
	private String start_date;
	private String end_date;
	private String categoryCode;
	private String year;
	private String month;
	private String rowNo;
	private String locale;
	
	
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}
}
