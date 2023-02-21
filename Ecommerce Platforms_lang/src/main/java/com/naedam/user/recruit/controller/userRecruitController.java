package com.naedam.user.recruit.controller;


import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naedam.admin.common.NaedamUtils;
import com.naedam.admin.recruit.model.service.RecruitService;
import com.naedam.admin.recruit.model.vo.recruitContentsDTO;
import com.naedam.admin.recruit.model.vo.recruitDTO;
import com.naedam.user.recruit.model.service.UserRecruitService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RestController
@RequestMapping("/user/recruit/*")
@Slf4j
public class userRecruitController {
	
	@Autowired
	private UserRecruitService userRecruitService;
	@Autowired
	private RecruitService recruitService;
	
	@RequestMapping(value="userRecruitList")
	public ModelAndView recruitList(Model model, @RequestParam(value = "searchKeyword", required = false)String searchKeyword, 
			@RequestParam(defaultValue = "1") int cPage, HttpServletRequest request) throws Exception {
		
		//조회 전 마감일자 지난 list들 채용마감으로 변경
		recruitService.updateContentsStatus();
		
		//게시글 리스트 수 limit 10으로
		int limit = 6;
		int offset = (cPage - 1) * limit;
				
		Map<String, Object> map = new HashMap<>();
		map.put("searchKeyword", searchKeyword);
		map.put("limit", limit);
		map.put("offset", offset);
		Map<String, Object> resultMap = userRecruitService.selectRecruitList(map);
		System.out.println("resultMap>>>>>" + resultMap);
		//조회된 총 갯수
		int totalPostListCount = Integer.parseInt(resultMap.get("totalCount").toString());
		
		// pagebar
		String pagebar = NaedamUtils.getPagebar(cPage, limit, totalPostListCount, request.getRequestURI());
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println("pagebar>>>>>>" +pagebar);
		
		mv.addObject("pagebar", pagebar);		
		mv.addObject("list", resultMap.get("list")); 
		mv.addObject("pageCount",totalPostListCount);		
		mv.setViewName("user/recruit/userRecruitList");
		return mv;
	}
	
	//paging 처리
	@RequestMapping(value = "userRecruitListPaging")
	public Map<String, Object> userRecruitListPaging(HttpServletRequest request,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam("searchKeyword") String searchKeyword){
		
		int limit = 6;
		int offset = (cPage - 1) * limit;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", searchKeyword);
		map.put("limit", limit);
		map.put("offset", offset);
		
		System.out.println("userRecruitListPaging map >>>> " + map);
		
		Map<String, Object> resultList = userRecruitService.selectRecruitList(map);
		System.out.println("userRecruitListPaging resultMap>>>>>" + resultList);
		//조회된 총 갯수
		int totalPostListCount = Integer.parseInt(resultList.get("totalCount").toString());
		// pagebar
		String pagebar = NaedamUtils.getPagebar(cPage, limit, totalPostListCount, request.getRequestURI());
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("recruit", resultList);
		resultMap.put("pagebar", pagebar);
		
		return resultMap;
	}
	
	
	
	@RequestMapping(value = "getRecruitDetail/{recruitNo}")
	public ModelAndView recruitDetail(@PathVariable("recruitNo")int recruitNo) {
		
		//채용글 1차
		recruitDTO recruitData = recruitService.getRecruitData(recruitNo);
				
		//채용글 2차 (리스트 여러개)
		List<recruitContentsDTO> contents = recruitService.getContentsData(recruitNo);
		
		System.out.println("user recruitData>>>>>" + recruitData);
		System.out.println("user contents>>>>>" + contents);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("recruitData", recruitData);
		mv.addObject("contents", contents);
		mv.setViewName("user/recruit/userRecruitDetail");
		return mv;
	}
	
	//파일 다운로드
	@GetMapping("fileDownload/{recruitNo}")
	public void fileDownload(@PathVariable("recruitNo")int recruitNo, 
			HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		recruitDTO file = userRecruitService.getFileInfo(recruitNo);
		
//		String filePath = file.getFilePath();
		String filePath = request.getServletContext().getRealPath(file.getFilePath());
		
		String fileName = file.getFileName();
		String orgFileName = file.getOrgFileName();

        File downloadFile = new File(filePath+ "/" + fileName);
        
        byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);
        
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(orgFileName,"UTF-8") +"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        response.getOutputStream().write(fileByte);
        response.getOutputStream().flush();
        response.getOutputStream().close();
	}
	

}
