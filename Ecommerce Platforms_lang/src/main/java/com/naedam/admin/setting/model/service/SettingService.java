package com.naedam.admin.setting.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.admin.award.model.vo.Award;
import com.naedam.admin.history.model.vo.History;
import com.naedam.admin.setting.model.vo.AdminMenu;
import com.naedam.admin.setting.model.vo.AdminSetting;
import com.naedam.admin.setting.model.vo.Partner;


public interface SettingService {
	
	public void partnerProcess(Map<String, Object> map) throws Exception;
	
	List<History> selectHistoryList(int limit, int offset);
	
	List<Award> selectAwardList();

	List<AdminMenu> selectAdminMenuList();

	List<Partner> selectPartner() throws Exception;
	
	Map<String, Object> adminPartnerList(Map<String, Object> map) throws Exception;
	
	Partner getPartner(int partnerNo) throws Exception;
	
	AdminSetting selectAdminSetting();
	
	int infoProcess(Map<String, Object> map);

	int updateAdminSetting(AdminSetting adminSetting);

	int updateAdminMenu(String menuNo);

	int updateAdminMenuAllN();

	int selectAllHistoryList();
	
}
