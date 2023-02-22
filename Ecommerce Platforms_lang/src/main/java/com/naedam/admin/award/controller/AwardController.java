package com.naedam.admin.award.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.award.model.service.AwardService;
import com.naedam.admin.award.model.vo.Award;
import com.naedam.admin.history.model.vo.History;

@Controller
@RequestMapping("/admin/award")
public class AwardController {

	@Autowired
	private AwardService awardService;
	
	/**
	 * 설정 => 연혁 관리 정보 조회
	 * @param historyNo
	 * @return
	 */
	@RequestMapping("/getAward")
	@ResponseBody
	public Award getAward(@RequestParam("awardNo") int awardNo) {
		System.out.println("awardNo >>>>>" + awardNo);
		Award award = awardService.selectDetailByNo(awardNo);
		return award;
	}
	
	/**
	 * 설정 => 연혁 관리 DML 프로세스
	 * @param request
	 * @param award
	 * @param redirectAttr
	 * @return
	 * @throws Exception
	 */
	@PostMapping("award_process")
	public String award_process(HttpServletRequest request, Award award, 
								RedirectAttributes redirectAttr,
								@RequestParam(value="awardImage", required = false) MultipartFile awardImage,
								@RequestParam(value = "locale", defaultValue = "ko") String locale) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("award", award);
		map.put("mode", request.getParameter("mode"));
		map.put("request", request);
		map.put("awardImage", awardImage);
		map.put("locale", locale);
		
		Map<String, Object> resultMap = awardService.awardProcess(map);
		redirectAttr.addFlashAttribute("msg", (String)resultMap.get("msg"));
		return "redirect:/admin/setting/award?locale="+locale;
	}
	
	
}
