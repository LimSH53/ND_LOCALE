package com.naedam.admin.award.model.dao;

import java.util.List;

import com.naedam.admin.award.model.vo.Award;

public interface AwardDao {

	void insertAward(Award award);

	void updateAward(Award award);

	void deleteAward(int awardNo);

	public Award selectDetailByNo(int awardNo);

	public List<Award> selectAwardList();
	
	public List<Award> SelectYear();

	public List<Award> SelectMonth();



}
