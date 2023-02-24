package com.naedam.admin.history.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.admin.history.model.vo.History;

@Repository
public class HistoryDaoImpl implements HistoryDao {
	@Autowired
	private SqlSession session;

	@Override
	public History selectOneHistoryByHisNo(int historyNo) {
		System.out.println("selectOneHistoryByHisNo Dao >>>");
		// TODO Auto-generated method stub
		return session.selectOne("history.selectOneHistoryByHisNo", historyNo);
	}

	@Override
	public int insertHistory(History history) {
		// TODO Auto-generated method stub
		System.out.println("insertHistory Dao >>>");
		return session.insert("history.insertHistroy", history);
	}

	@Override
	public int updateHistory(History history) {
		// TODO Auto-generated method stub
		System.out.println("updateHistory Dao >>>");
		return session.update("history.updateHistory", history);
	}

	@Override
	public int deleteHistory(int historyNo) {
		// TODO Auto-generated method stub
		System.out.println("deleteHistory Dao >>>");
		return session.delete("history.deleteHistory", historyNo);
	}

	@Override
	public List<History> selectHistoryList(Map<String,Object> map) {
		// TODO Auto-generated method stub
		System.out.println("selectHistoryList Dao >>>");
		return session.selectList("history.selectHistoryList", map);
	}

	@Override
	public List<History> selectYearList(Map<String,Object> map) {
		// TODO Auto-generated method stub
		System.out.println("selectYearList Dao >>>");
		return session.selectList("history.selectYearList", map);
	}

	@Override
	public List<History> selectMonthList(Map<String,Object> map) {
		// TODO Auto-generated method stub
		System.out.println("selectMonthList Dao >>>");
		return session.selectList("history.selectMonthList", map);
	}
	
	
}