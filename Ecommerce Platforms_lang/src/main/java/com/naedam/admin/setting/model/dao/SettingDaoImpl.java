package com.naedam.admin.setting.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.admin.award.model.vo.Award;
import com.naedam.admin.history.model.vo.History;

import com.naedam.admin.setting.model.vo.AdminMenu;
import com.naedam.admin.setting.model.vo.AdminSetting;
import com.naedam.admin.setting.model.vo.Partner;

@Repository
public class SettingDaoImpl implements SettingDao {
	@Autowired
	private SqlSession session;


	@Override
	public void addPartner(Partner partner) throws Exception {
		session.insert("setting.addPartner", partner);
	}
	
	@Override
	public List<History> selectHistoryList(int limit, int offset) {
		// TODO Auto-generated method stub
		Map<String, Integer> paging = new HashMap<>();
		paging.put("limit", limit);
		paging.put("offset", offset);
		return session.selectList("setting.selectHistoryList", paging);
	}
	
	@Override
	public List<Award> selectAwardList() {
		// TODO Auto-generated method stub
		System.out.println("log++++"+session.selectList("setting.selectAwardList"));
		return session.selectList("setting.selectAwardList");
	}

	@Override
	public List<AdminMenu> selectAdminMenuList() {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectAdminMenuList");
	}
	
	@Override
	public List<Partner> selectPartner() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("setting.selectPartnerList");
	}
	
	@Override
	public List<Partner> adminPartnerList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("setting.adminPartnerList", map);
	}	

	@Override
	public AdminSetting selectAdminSetting() {
		// TODO Auto-generated method stub
		return session.selectOne("setting.selectAdminSetting");
	}
	
	@Override
	public Partner getPartner(int partnerNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("setting.getPartner", partnerNo);
	}

	@Override
	public int updateAdminSetting(AdminSetting adminSetting) {
		// TODO Auto-generated method stub
		return session.update("setting.updateAdminSetting", adminSetting);
	}

	@Override
	public int updateAdminMenu(String menuNo) {
		// TODO Auto-generated method stub
		return session.update("setting.updateAdminMenu", menuNo);
	}

	@Override
	public int updateAdminMenuAllN() {
		// TODO Auto-generated method stub
		return session.update("setting.updateAdminMenuAllN");
	}

	@Override
	public void updatePartner(Partner partner) throws Exception {
		// TODO Auto-generated method stub
		session.update("setting.updatePartner", partner);
	}

	@Override
	public void deletePartner(List<Integer> partnerNo) throws Exception {
		// TODO Auto-generated method stub
		session.delete("setting.deletePartner", partnerNo);
	}

	@Override
	public int selectAllHistoryList() {
		// TODO Auto-generated method stub
		return session.selectOne("setting.selectAllHistoryList");
	}

	@Override
	public int adminPartnerTotalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("setting.adminPartnerTotalCount", map);
	}


}
