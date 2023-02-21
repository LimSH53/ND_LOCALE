package com.naedam.user.recruit.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.naedam.admin.recruit.model.vo.recruitDTO;

public interface UserRecruitService {

	//user 채용 게시글
	Map<String, Object> selectRecruitList(Map<String, Object> map);

	//파일 정보
	recruitDTO getFileInfo(int recruitNo);

	

}
