package com.naedam.admin.recruit.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.naedam.admin.board.model.vo.Post;
import com.naedam.admin.recruit.model.vo.recruitContentsDTO;
import com.naedam.admin.recruit.model.vo.recruitDTO;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class RecruitDaoImpl implements RecruitDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<recruitDTO> getRecruitList(String search, int offset, int limit) throws Exception {
		System.out.println("==========recruitList dao =================");
		System.out.println("search>>>" + search);
		/* RowBounds rowBounds = new RowBounds(offset, limit); */
		Map<String, Object> page = new HashMap<>();
		page.put("search", search);
		page.put("offset", offset);
		page.put("limit", limit);
		System.out.println("page>>>" + page);
		return sqlSession.selectList("recruit.getRecruitList", page);
	}
	
	@Override
	public Object getTotalCount(String search) {
		return sqlSession.selectOne("recruit.getTotalCount", search);
	}

	@Override
	public int deleteRecruit(int recruitNum) {
		return sqlSession.update("recruit.deleteRecruit", recruitNum);
	}

	@Override
	public int insertRecruit(recruitDTO recruit) {
		log.info(">>>>>insertRecruitDAO 실행");
		return sqlSession.insert("recruit.insertRecruit", recruit);
	}

	@Override
	public int insertFile(recruitDTO recruit) {
		log.info(">>>>>insertFileDAO 실행");
		return sqlSession.update("recruit.insertFile", recruit);
	}

	@Override
	public int insertRecruitContents(recruitContentsDTO recruitContentsDTO) {
		log.info(">>>>>recruitContentsDTO :" + recruitContentsDTO);
		return sqlSession.insert("recruit.insertRecruitContents", recruitContentsDTO);
	}

	@Override
	public recruitDTO getRecruitData(int recruitNo) {
		System.out.println("getContentsData dao ==== " + recruitNo);
		return sqlSession.selectOne("recruit.getRecruitData", recruitNo);
	}

	@Override
	public List<recruitContentsDTO> getContentsData(int recruitNo) {
		System.out.println("getContentsData dao ==== " + recruitNo);
		return sqlSession.selectList("recruit.getContentsData", recruitNo);
	}

	@Override
	public int updateRecruit(recruitDTO recruit) {
		System.out.println("updateRecruit dao ==== " + recruit);
		return sqlSession.update("recruit.updateRecruit", recruit);
	}

	@Override
	public int deleteRecruitContents(int curRecruitNo) {
		System.out.println("deleteRecruitContents dao ==== " + curRecruitNo);
		return sqlSession.delete("recruit.deleteRecruitContents", curRecruitNo);
	}

	@Override
	public int updateContentsStatus() {
		System.out.println("updateContentsStatus dao ==== " + sqlSession.update("recruit.updateContentsStatus"));
		return sqlSession.update("recruit.updateContentsStatus");
	}

	@Override
	public int deleteFile(int curRecruitNo) {
		
		return sqlSession.update("recruit.deleteFile", curRecruitNo);
	}



	
}

