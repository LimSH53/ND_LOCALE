package com.naedam.user.recruit.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.naedam.admin.recruit.model.vo.recruitDTO;

@Repository
public class UserRecruitDaoImpl implements UserRecruitDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<recruitDTO> selectRecruitList(Map<String, Object> map) {
		return sqlSession.selectList("selectRecruitList", map);
	}

	@Override
	public Object getTotalCount(Map<String, Object> map) {
		return sqlSession.selectOne("getUserTotalCount", map);
	}

	@Override
	public recruitDTO getFileInfo(int recruitNo) {
		return sqlSession.selectOne("getFileInfo", recruitNo);
	}

}
