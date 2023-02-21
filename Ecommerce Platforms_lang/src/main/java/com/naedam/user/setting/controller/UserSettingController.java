package com.naedam.user.setting.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.admin.award.model.service.AwardService;
import com.naedam.admin.history.model.service.HistoryService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user/setting/*")
@Slf4j
public class UserSettingController {
	
	@Autowired
	private HistoryService historyService;
	
	@Autowired
	private AwardService awardService;
	
	int pageUnit = 5;
	int pageSize = 5;

	
	//연혁 목록
	@RequestMapping(value="historyList")
	public String historyList(Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("historyList 시작");
		Map<String, Object> resultMap = historyService.selectHistoryList();
		System.out.println(resultMap.get("history"));
		model.addAttribute("history", resultMap.get("history"));
		
		Map<String, Object> awardMap = awardService.selectAwardList();
		System.out.println(awardMap.get("award"));
		model.addAttribute("award", awardMap.get("award"));

		return "";
	}
	
}

