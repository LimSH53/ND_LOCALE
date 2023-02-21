package com.naedam.admin.setting.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.admin.award.model.vo.Award;
import com.naedam.admin.history.model.vo.History;
import com.naedam.admin.setting.model.vo.AdminMenu;
import com.naedam.admin.setting.model.vo.AdminSetting;
import com.naedam.admin.setting.model.vo.Partner;

public interface SettingDao {

	public void addPartner(Partner partner) throws Exception;
	
	List<History> selectHistoryList(int limit, int offset);

	List<Award> selectAwardList();
	
	List<AdminMenu> selectAdminMenuList();
	
	List<Partner> selectPartner() throws Exception;
	
	List<Partner> adminPartnerList(Map<String, Object> map) throws Exception;
	
	Partner getPartner(int partnerNo) throws Exception;
	
	AdminSetting selectAdminSetting();

	int updateAdminSetting(AdminSetting adminSetting);

	int updateAdminMenu(String menuNo);

	int updateAdminMenuAllN();
	
	public void updatePartner(Partner partner) throws Exception;
	
	public void deletePartner(List<Integer> partnerNo) throws Exception;

	public int selectAllHistoryList();

	public int adminPartnerTotalCount(Map<String, Object> map);

}
