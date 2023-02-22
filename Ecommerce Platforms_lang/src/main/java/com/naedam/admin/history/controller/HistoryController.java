package com.naedam.admin.history.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.history.model.service.HistoryService;
import com.naedam.admin.history.model.vo.History;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/history")
@Slf4j
public class HistoryController {
	@Autowired
	private HistoryService historyService;
	
	/**
	 * 설정 => 연혁 관리 정보 조회
	 * @param historyNo
	 * @return
	 */
	@PostMapping("/getHistory")
	@ResponseBody
	public History getHistory(int historyNo) {
		History history = historyService.selectOneHistoryByHisNo(historyNo);
		return history;
	}
	
	/**
	 * 설정 => 연혁 관리 DML 프로세스
	 * @param request
	 * @param history
	 * @param redirectAttr
	 * @return
	 * @throws Exception
	 */
	@PostMapping("history_process")
	public String history_process(HttpServletRequest request, History history, RedirectAttributes redirectAttr,
								  @RequestParam(value="historyImage", required = false) MultipartFile historyImage,
								  @RequestParam(value = "locale", defaultValue = "ko") String locale) throws Exception {
		
		System.out.println(">>>>>history_process");
		Map<String, Object> map = new HashMap<>();
		map.put("history", history);
		map.put("mode", request.getParameter("mode"));
		map.put("request", request);
		map.put("locale", locale);
		/* map.put("historyImage", historyImage); */
		System.out.println("map>>>" + map);
		Map<String, Object> resultMap = historyService.historyProcess(map);
		redirectAttr.addFlashAttribute("msg", (String)resultMap.get("msg"));
				
		return "redirect:/admin/setting/history";
	}
	
}
