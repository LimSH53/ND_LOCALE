package com.naedam.admin.board.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class Search implements Serializable {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
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
	
	
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

}


