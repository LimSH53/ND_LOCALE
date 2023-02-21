package com.naedam.admin.history.model.dao;

import java.util.List;

import com.naedam.admin.history.model.vo.History;

public interface HistoryDao {

	History selectOneHistoryByHisNo(int historyNo);

	public List<History> selectHistoryList();
	
	public List<History> selectYearList();

	public List<History> selectMonthList();
	
	int insertHistory(History history);

	int updateHistory(History history);

	int deleteHistory(int historyNo);


}