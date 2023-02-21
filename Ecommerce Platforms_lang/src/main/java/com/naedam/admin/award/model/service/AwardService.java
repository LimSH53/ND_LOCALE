package com.naedam.admin.award.model.service;

import java.util.Map;

import com.naedam.admin.award.model.vo.Award;

public interface AwardService {

	Map<String, Object> awardProcess(Map<String, Object> map) throws Exception;

	void insertAward(Award award);

	void updateAward(Award award);

	void deleteAward(int awardNo);

	public Map<String,Object> selectAwardList() throws Exception;

	public Award selectDetailByNo(int awardNo);
	
	
}
