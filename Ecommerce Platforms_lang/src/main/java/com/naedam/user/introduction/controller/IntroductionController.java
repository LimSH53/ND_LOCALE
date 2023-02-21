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
	public ModelAndView businessIntroduction() throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = businessService.getBusinessList(map);
		List<Business> businessList = (List<Business>) resultMap.get("list");
		List<BusinessPost> businessPost = businessService.getBusinessPostAllList();
		mv.addObject("businessList",businessList);
		mv.addObject("businessPost",businessPost);
		mv.setViewName("user/introduction/businessIntroduction");
		return mv;		
	}
	
	@RequestMapping(value="introduction")
	public ModelAndView introduction(@RequestParam("businessPostNo") int businessPostNo) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("businessPostNo", businessPostNo);
		BusinessPost businessPost = businessService.getBusinessPost(businessPostNo);
		List<BusinessContents> businessContentsList = businessService.getBusinessContentsList(map);
		mv.addObject("businessPost",businessPost);
		mv.addObject("businessContentsList",businessContentsList);
		mv.setViewName("user/introduction/introductionDetail");
		return mv;
	}
	
	@RequestMapping(value="consulting")
	public ModelAndView consulting() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/consulting");
		return mv;		
	}
	
	@RequestMapping(value="si")
	public ModelAndView si() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/si/si");
		return mv;		
	}
	
	@RequestMapping(value="digitalTwin")
	public ModelAndView digitalTwin(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/digitalTwin");
		return mv;
	}
	
	@RequestMapping(value="visionAi")
	public ModelAndView visionAi(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/visionAi");
		return mv;
	}
	
	@RequestMapping(value="cloudMsp")
	public ModelAndView cloudMsp(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/cloudMsp");
		return mv;
	}

	@RequestMapping(value="scm")
	public ModelAndView scm(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/scm");
		return mv;
	}
	
	@RequestMapping(value="innoPlm")
	public ModelAndView innoPlm(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/innoPlm");
		return mv;
	}
	
	@RequestMapping(value="innoAms")
	public ModelAndView innoAms(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/innoAms");
		return mv;
	}
	
	@RequestMapping(value="mes")
	public ModelAndView mes(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/mes");
		return mv;
	}
	
	@RequestMapping(value="solutionDevelopment")
	public ModelAndView solutionDevelopment(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/solutionDevelopment");
		return mv;
	}
	
	@RequestMapping(value="meatProcessing")
	public ModelAndView meatProcessing(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/meatProcessing");
		return mv;
	}
	
	@RequestMapping(value="mixFeed")
	public ModelAndView mixFeed(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/mixFeed");
		return mv;
	}
	
	@RequestMapping(value="erpManagement")
	public ModelAndView erpManagement(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/introduction/solution/erpManagement");
		return mv;
	}	
	
}
