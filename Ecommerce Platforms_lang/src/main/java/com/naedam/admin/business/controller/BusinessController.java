package com.naedam.admin.business.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.board.model.vo.BoardOption;
import com.naedam.admin.business.model.service.BusinessService;
import com.naedam.admin.business.model.service.BusinessServiceImpl;
import com.naedam.admin.business.model.vo.Business;
import com.naedam.admin.business.model.vo.BusinessContents;
import com.naedam.admin.business.model.vo.BusinessPost;
import com.naedam.admin.common.Comm;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/business/*")
@Slf4j
public class BusinessController {

	@Autowired
	private BusinessService businessService;
	
	/**
	 * 사업관리에 관련한 DML 프로세스
	 * @param business
	 * @param boardOption
	 * @param mode
	 * @return
	 * @throws Exception
	 */
	@PostMapping("businessProcess")
	public String businessProcess(@ModelAttribute("business") Business business, 
								  @ModelAttribute("boardOption") BoardOption boardOption,
								  @RequestParam("mode") String mode
								 ,@RequestParam(value="icon", required = false) MultipartFile icon,
								  HttpServletRequest request) throws Exception{
		Map<String, Object> businessMap = new HashMap<String, Object>();
		businessMap.put("mode", mode);
		businessMap.put("business", business);
		businessMap.put("boardOption", boardOption);
		businessMap.put("icon", icon);
		businessService.businessProcess(businessMap);
		return "redirect:/admin/business/getBusinessList";
	}
	
	@PostMapping("businessPostProcess")
	public String businessPostProcess(@ModelAttribute("business") Business business
									  ,@ModelAttribute("businessPost") BusinessPost businessPost  
									  ,@RequestParam(value="icon", required = false) MultipartFile icon
									  ,@RequestParam(value="img", required = false) MultipartFile img
									  ,@RequestParam("secNo") String secNo 
									  ,@RequestParam("mode") String mode
								      ,HttpServletRequest request) throws Exception{
		String filePath = request.getServletContext().getRealPath("resources/user/images/introduction/icon/");
		String filePath2 = request.getServletContext().getRealPath("resources/user/images/main/");
		Map<String, Object> businessPostMap	 = new HashMap<>();
		businessPostMap.put("business", business);
		businessPostMap.put("businessPost", businessPost);
		businessPostMap.put("mode", mode);
		businessPostMap.put("icon", icon);
		businessPostMap.put("img", img);
		businessPostMap.put("filePath", filePath);
		businessPostMap.put("filePath2", filePath2);
		businessPostMap.put("secNo", secNo);
		businessService.businessPostProcess(businessPostMap);
		return "redirect:/admin/business/getBusinessPostList?businessNo="+business.getBusinessNo();
	}
	
	@PostMapping("businessContentsProcess")
	public String businessContentsProcess(@ModelAttribute("businessContents") BusinessContents businessContents
										 ,@ModelAttribute("businessPost") BusinessPost businessPost
										 ,@RequestParam(value="file", required = false) MultipartFile file
										 ,@RequestParam("secNo") String secNo 
										 ,@RequestParam("mode") String mode
									     ,HttpServletRequest request) throws Exception{
		String filePath = request.getServletContext().getRealPath("resources/user/images/introduction/");
		System.out.println("확인222 === "+businessContents);
		Map<String, Object> businessContentsMap	 = new HashMap<>();
		businessContentsMap.put("businessContents", businessContents);
		businessContentsMap.put("businessPost", businessPost);
		businessContentsMap.put("file", file);
		businessContentsMap.put("secNo", secNo);
		businessContentsMap.put("mode", mode);
		businessContentsMap.put("filePath", filePath);
		businessService.businessContentsProcess(businessContentsMap);
		return "redirect:/admin/business/getBusinessContentsList?businessPostNo="+businessPost.getBusinessPostNo();
	}
	
	/**
	 * 사업관리 리스트
	 * @param search
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping("getBusinessList")
	public String getBusinessList(@ModelAttribute("comm") Comm comm, Model model) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comm", comm);
		Map<String, Object> resultMap = businessService.getBusinessList(map);
		model.addAttribute("business", resultMap.get("list"));
		return "admin/business/businessList";
	}
	
	@RequestMapping( value="getBusinessPostList")
	public String getBusinessPostList(@ModelAttribute("comm") Comm comm, Model model, HttpServletRequest request ,
									  @RequestParam("businessNo") int businessNo, 
									  @RequestParam(defaultValue = "1") int cPage) throws Exception{
		//게시글 리스트 수 limit 10으로
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		Business business = businessService.getBusiness(businessNo);
		model.addAttribute("business", business);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comm", comm);
		map.put("businessNo", businessNo);
		List<BusinessPost> businessPost = businessService.getBusinessPostList(map);
		model.addAttribute("list", businessPost);
		// pagebar
		String url = request.getRequestURI();
		//String pagebar = Mir9Utils.getPagebar(cPage, limit, totalPostListCount, url);
		
		return "admin/business/businessPostList";
	}
	
	@RequestMapping(value="getBusinessContentsList")
	public String getBusinessContentsList(@ModelAttribute("comm") Comm comm, Model model, HttpServletRequest request,
										  @RequestParam("businessPostNo") int businessPostNo) throws Exception{
		BusinessPost businessPost = businessService.getBusinessPost(businessPostNo);
		model.addAttribute("businessPost", businessPost);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comm", comm);
		map.put("businessPostNo", businessPostNo);
		List<BusinessContents> businessContents = businessService.getBusinessContentsList(map);
		model.addAttribute("businessContents",businessContents);
		model.addAttribute("businessPostNo", businessPostNo);
		return "admin/business/businessContentsList";
	}
	
	
	
	
	
	
	
	
}
