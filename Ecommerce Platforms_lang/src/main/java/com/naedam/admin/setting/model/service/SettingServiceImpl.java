package com.naedam.admin.setting.model.service;

import java.io.File;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.award.model.vo.Award;
import com.naedam.admin.history.model.vo.History;
import com.naedam.admin.setting.model.dao.SettingDao;
import com.naedam.admin.setting.model.vo.AdminMenu;
import com.naedam.admin.setting.model.vo.AdminSetting;
import com.naedam.admin.setting.model.vo.Partner;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.OnError;

@Slf4j
@Service
public class SettingServiceImpl implements SettingService {
	@Autowired
	public SettingDao settingDao;
	
	/*
	 * 기본설정의 프로세스
	 * map의 담긴 mode의 값의 조건에 따라 데이터 출력
	 */
	@Override
	public int infoProcess(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<>();
		AdminSetting adminSetting = (AdminSetting) map.get("adminSetting");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int result = 0;
		if("info".equals(map.get("mode"))) {
			String phone = request.getParameter("mobile1") + request.getParameter("mobile2")
					+ request.getParameter("mobile3");
			String callerId = request.getParameter("tel1") + request.getParameter("tel2")
					+ request.getParameter("tel3");
			adminSetting.setPhone(phone);
			adminSetting.setCallerId(callerId);
			if (adminSetting.getIsDiscount() == null)
				adminSetting.setIsDiscount("N");
		
			List<String> menuList = Arrays.asList(request.getParameterValues("admin_menu_list[]"));
			result = settingDao.updateAdminMenuAllN();
			for (String menuNo : menuList) {
				result = settingDao.updateAdminMenu(menuNo);
			}
			result = settingDao.updateAdminSetting(adminSetting);			
		}
		
		return result;
	}
	
	public void partnerProcess(Map<String, Object> map) throws Exception{
		Partner partner = (Partner) map.get("partner");
		MultipartFile file = (MultipartFile) map.get("file");
		if("insert".equals(map.get("mode"))) {
			File file2 = new File(map.get("filePath")+file.getOriginalFilename());
			partner.setPartnerImage(file.getOriginalFilename());
			file.transferTo(file2);
			settingDao.addPartner(partner);
		}else if("update".equals(map.get("mode"))) {
			if(file.isEmpty() == false) {
				File file2 = new File(map.get("filePath")+file.getOriginalFilename());
				partner.setPartnerImage(file.getOriginalFilename());
				file.transferTo(file2);
			}else if(file.isEmpty() == true) {
				Partner partnerData = settingDao.getPartner(partner.getPartnerNo());
				partner.setPartnerImage(partnerData.getPartnerImage());
			}
			settingDao.updatePartner(partner);
		}else if("delete".equals(map.get("mode"))) {
			List<Integer> partnerArr = (List<Integer>) map.get("partnerArr");
			settingDao.deletePartner(partnerArr);
		}
	}

	@Override
	public List<History> selectHistoryList(int limit, int offset) {
		// TODO Auto-generated method stub
		return settingDao.selectHistoryList(limit, offset);
	}

	@Override
	public List<Award> selectAwardList() {
		// TODO Auto-generated method stub
		return settingDao.selectAwardList();
	}

	@Override
	public List<AdminMenu> selectAdminMenuList() {
		// TODO Auto-generated method stub
		return settingDao.selectAdminMenuList();
	}

	@Override
	public AdminSetting selectAdminSetting() {
		// TODO Auto-generated method stub
		return settingDao.selectAdminSetting();
	}
	
	@Override
	public List<Partner> selectPartner() throws Exception{
		return settingDao.selectPartner();
	}
	
	@Override
	public Map<String, Object> adminPartnerList(Map<String, Object> map) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", settingDao.adminPartnerList(map));
		resultMap.put("totalCount", settingDao.adminPartnerTotalCount(map));
		System.out.println("resultMap====" + resultMap);
		return resultMap;
	}

	@Override
	public Partner getPartner(int partnerNo) throws Exception {
		// TODO Auto-generated method stub
		return settingDao.getPartner(partnerNo);
	}

	@Override
	public int updateAdminSetting(AdminSetting adminSetting) {
		// TODO Auto-generated method stub
		return settingDao.updateAdminSetting(adminSetting);
	}

	@Override
	public int updateAdminMenu(String menuNo) {
		// TODO Auto-generated method stub
		return settingDao.updateAdminMenu(menuNo);
	}

	@Override
	public int updateAdminMenuAllN() {
		// TODO Auto-generated method stub
		return settingDao.updateAdminMenuAllN();
	}

	@Override
	public int selectAllHistoryList() {
		// TODO Auto-generated method stub
		return settingDao.selectAllHistoryList();
	}


}
