package com.naedam.admin.award.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.admin.award.model.vo.Award;

@Repository
public class AwardDaoimpl implements AwardDao {

	@Autowired
	private SqlSession session;

	@Override
	public void insertAward(Award award) {
		System.out.println("insertAward dao =====" + award);
		session.insert("award.insertAward", award);
	}

	@Override
	public void updateAward(Award award) {
		session.update("award.updateAward", award);
	}

	@Override
	public void deleteAward(int awardNo) {
		session.delete("award.deleteAward", awardNo);
	}

	@Override
	public List<Award> selectAwardList(Map<String, Object> map) {
		System.out.println("check === "+session.selectList("award.selectAwardList"));
		return session.selectList("award.selectAwardList", map);
	}

	@Override
	public Award selectDetailByNo(int awardNo) {
		return session.selectOne("award.selectDetailByNo", awardNo);
	}

	@Override
	public List<Award> SelectYear(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("award.selectYear", map);
	}

	@Override
	public List<Award> SelectMonth(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("award.selectMonth", map);
	}


}
