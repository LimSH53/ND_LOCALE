package com.naedam.admin.award.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.admin.award.model.vo.Award;

public interface AwardDao {

	void insertAward(Award award);

	void updateAward(Award award);

	void deleteAward(int awardNo);

	public Award selectDetailByNo(int awardNo);

	public List<Award> selectAwardList(Map<String, Object> map);
	
	public List<Award> SelectYear(Map<String, Object> map);

	public List<Award> SelectMonth(Map<String, Object> map);



}
