package com.naedam.user.recruit.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.recruit.model.vo.recruitDTO;
import com.naedam.user.recruit.model.dao.UserRecruitDao;

@Service
public class UserRecruitServiceImpl implements UserRecruitService{

	@Autowired
	private UserRecruitDao userRecruitDao;
	
	@Override
	public Map<String, Object> selectRecruitList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<>();
		//user 채용 게시글 리스트
		resultMap.put("list", userRecruitDao.selectRecruitList(map));
		System.out.println("resultMap.list" + resultMap.get("list"));
		//user 채용 게시글 수
		resultMap.put("totalCount", userRecruitDao.getTotalCount(map));
		System.out.println("resultMap.totalCount" + resultMap.get("totalCount"));
		return resultMap;
	}

	@Override
	public recruitDTO getFileInfo(int recruitNo) {
		
		recruitDTO getFileInfo = userRecruitDao.getFileInfo(recruitNo);
		
		return getFileInfo;
	}

}
