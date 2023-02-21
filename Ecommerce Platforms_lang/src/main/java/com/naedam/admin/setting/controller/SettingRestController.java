package com.naedam.admin.setting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.naedam.admin.setting.model.service.SettingService;
import com.naedam.admin.setting.model.vo.Partner;

@RestController
@RequestMapping("/admin/setting/*")
public class SettingRestController {

	@Autowired
	private SettingService settingService;
	
	@PostMapping(value="json/getPartner")
	public Partner getPartner(@RequestParam("code") int code) throws Exception{
		return settingService.getPartner(code);
	}
	
	@PostMapping("json/partnerProcess")
	public Boolean partnerProcess(@RequestParam(value = "partnerArr[]") List<String> partnerArr,  
								  @RequestParam("mode") String mode) throws Exception{
		Boolean result = false;
		Map<String, Object> partnerMap = new HashMap<>();
		partnerMap.put("partnerArr", partnerArr);
		partnerMap.put("mode", mode);
		settingService.partnerProcess(partnerMap);
		result = true;
		return result;
	}
}
