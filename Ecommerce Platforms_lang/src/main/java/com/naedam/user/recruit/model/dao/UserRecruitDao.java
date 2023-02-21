package com.naedam.user.recruit.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.admin.recruit.model.vo.recruitDTO;

public interface UserRecruitDao {

	//user 채용 게시글 리스트
	public List<recruitDTO> selectRecruitList(Map<String, Object> map);

	//user 채용 게시글 수
	public Object getTotalCount(Map<String, Object> map);

	//파일 정보
	public recruitDTO getFileInfo(int recruitNo);

}
