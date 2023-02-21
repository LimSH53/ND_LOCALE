package com.naedam.admin.business.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.naedam.admin.business.model.vo.Business;
import com.naedam.admin.business.model.vo.BusinessContents;
import com.naedam.admin.business.model.vo.BusinessPost;

@Repository
public class BusinessDaoImpl implements BusinessDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/**
	 * business Insert
	 */
	@Override
	public void addBusiness(Business business) throws Exception{
		sqlSession.insert("business.addBusiness", business);
	}
	

	@Override
	public void addBusinessPost(BusinessPost businessPost) throws Exception {
		sqlSession.insert("business.addBusinessPost", businessPost);
	}
	
	@Override
	public void addBusinessContents(BusinessContents businessContents) throws Exception {
		sqlSession.insert("business.addBusinessContents", businessContents);
	}
	
	/**
	 * 
	 */
	@Override
	public Business getBusiness(int businessNo) throws Exception {
		return sqlSession.selectOne("business.getBusiness", businessNo);
	}
	
	/**
	 * 
	 */
	@Override
	public BusinessPost getBusinessPost(int businessPostNo) throws Exception {
		return sqlSession.selectOne("business.getBusinessPost", businessPostNo);
	}
	
	/**
	 * 
	 */
	@Override
	public BusinessContents getBusinessContents(int businessContentsNo) throws Exception{
		System.out.println("접근확인 ==== "+businessContentsNo);
		return sqlSession.selectOne("business.getBusinessContents", businessContentsNo);
	}
	
	/**
	 * business Select
	 */
	@Override
	public List<Business> getBusinessList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("business.getBusinessList", map);
	}
	
	/**
	 * businessPost Select
	 */
	@Override
	public List<BusinessPost> getBusinessPostList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("business.getBusinessPostList", map);
	}
	
	@Override
	public List<BusinessContents> getBusinessContentsList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList("business.getBusinessContentsList", map);
	}
	
	/**
	 * businessPost All Select
	 */
	@Override
	public List<BusinessPost> getBusinessPostAllList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("business.getBusinessPostAllList");
	}
	
	/**
	 * business update
	 */
	@Override
	public void updateBusiness(Business business) throws Exception{
		sqlSession.update("business.updateBusiness", business);
	}

	/**
	 * businessPost update
	 */
	@Override
	public void updateBusinessPost(BusinessPost businessPost) throws Exception {
		sqlSession.update("business.updateBusinessPost", businessPost);
	}
	
	@Override
	public void updateBusinessContents(BusinessContents businessContents) throws Exception{
		sqlSession.update("business.updateBusinessContents", businessContents);
	}
	
	/**
	 * business delete
	 */
	@Override
	public void deleteChoiceBusiness(List<Integer> businessNo) throws Exception {
		sqlSession.delete("business.deleteChoiceBusiness", businessNo);
	}
	
	/**
	 * business delete
	 */
	@Override
	public void deleteChoiceBusinessPost(List<Integer> businessPostNo) throws Exception {
		sqlSession.delete("business.deleteChoiceBusinessPost", businessPostNo);
	}
	
	@Override
	public void deleteChoiceBusinessContents(List<Integer> businessContentsNo) throws Exception{
		sqlSession.delete("business.deleteChoiceBusinessContents", businessContentsNo);
	}


	
}