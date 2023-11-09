package com.naedam.admin.history.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.admin.history.model.vo.History;

public interface HistoryDao {

	History selectOneHistoryByHisNo(int historyNo);

	public List<History> selectHistoryList(Map<String,Object> map);
	
	public List<History> selectYearList(Map<String,Object> map);

	public List<History> selectMonthList(Map<String,Object> map);
	
	int insertHistory(History history);

	int updateHistory(History history);

	int deleteHistory(int historyNo);


}