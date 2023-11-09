package com.naedam.user.introduction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naedam.admin.business.model.service.BusinessService;
import com.naedam.admin.business.model.vo.Business;
import com.naedam.admin.business.model.vo.BusinessContents;
import com.naedam.admin.business.model.vo.BusinessPost;

@Controller
@RestController
@RequestMapping("/user/introduction/*")
public class IntroductionController {
	
	@Autowired
	private BusinessService businessService;
	
	@RequestMapping(value="businessIntroduction")
	public ModelAndView businessIntroduction(@RequestParam(value = "locale", defaultValue = "ko") String locales) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("locale", locales);
		Map<String, Object> resultMap = businessService.getBusinessList(map);
		List<Business> businessList = (List<Business>) resultMap.get("list");
		List<BusinessPost> businessPost = businessService.getBusinessPostAllList(map);
		mv.addObject("businessList",businessList);
		mv.addObject("businessPost",businessPost);
		mv.setViewName("user/"+locales+"/introduction/businessIntroduction");
		return mv;		
	}
	
	@RequestMapping(value="introduction")
	public ModelAndView introduction(@RequestParam("businessPostNo") int businessPostNo,
									 @RequestParam(value = "locale", defaultValue = "ko") String locales) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("businessPostNo", businessPostNo);
		map.put("locale", locales);
		BusinessPost businessPost = businessService.getBusinessPost(businessPostNo);
		List<BusinessContents> businessContentsList = businessService.getBusinessContentsList(map);
		mv.addObject("businessPost",businessPost);
		mv.addObject("businessContentsList",businessContentsList);
		mv.setViewName("user/"+locales+"/introduction/introductionDetail");
		return mv;
	}
	
	
}
