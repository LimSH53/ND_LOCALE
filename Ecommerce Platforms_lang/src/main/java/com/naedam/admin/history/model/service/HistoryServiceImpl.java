package com.naedam.admin.history.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.award.model.vo.Award;
import com.naedam.admin.history.model.dao.HistoryDao;
import com.naedam.admin.history.model.vo.History;

@Service
public class HistoryServiceImpl implements HistoryService {
	@Autowired
	private HistoryDao historyDao;

	@Override
	public Map<String, Object> historyProcess(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("============historyProcess HistoryServiceImpl===============");
		Map<String, Object> resultMap = new HashMap<>();
		History history = (History) map.get("history");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String filePath = request.getServletContext().getRealPath("resources/user/images/company/history/");
		MultipartFile historyImage = (MultipartFile) map.get("historyImage");
		
		System.out.println("request.getParameter(\"history\") >>>>" + history);
		
		if("insert".equals(map.get("mode")) || "update".equals(map.get("mode"))) {
			System.out.println("history_process Service if insert >>>>");
			StringBuilder str = new StringBuilder();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date resultDate = new Date();
			str.append(request.getParameter("year"));
			if(request.getParameter("month").length() < 2) {
				str.append("0"+request.getParameter("month"));
			}else {
				str.append(request.getParameter("month"));
			}
			if(request.getParameter("date").length() < 2) {
				str.append("0" + request.getParameter("date"));
			}else {
				str.append(request.getParameter("date"));
			}
			resultDate = formatter.parse(str.toString());
			Date date = resultDate;
			history.setHistoryDate(date);
			history.setLocale((String)map.get("locale"));
			if("insert".equals(map.get("mode"))) {
				historyDao.insertHistory(history);
				resultMap.put("msg", "연혁 정보가 등록되었습니다.");
			}else if("update".equals(map.get("mode"))) {
				/*
				 * if(historyImage.isEmpty() == false) { File file = new
				 * File(filePath+historyImage.getOriginalFilename());
				 * history.setImgUrl(historyImage.getOriginalFilename());
				 * historyImage.transferTo(file); }else if(historyImage.isEmpty() == true) {
				 * History historyData =
				 * historyDao.selectOneHistoryByHisNo(history.getHistoryNo()); }
				 */
				/*
				 * History historyData =
				 * historyDao.selectOneHistoryByHisNo(history.getHistoryNo());
				 */
				historyDao.updateHistory(history);
				resultMap.put("msg", "연혁 정보가 수정되었습니다.");
			}
		}else if("delete".equals(map.get("mode"))) {
			List<String> historyNoList = Arrays.asList(request.getParameterValues("list[]"));
			for(String no : historyNoList) {
				historyDao.deleteHistory(Integer.parseInt(no));
			}
			resultMap.put("msg", "연혁이 삭제되었습니다.");
		}
		
		return resultMap;
	}
	
	@Override
	public History selectOneHistoryByHisNo(int historyNo) {
		// TODO Auto-generated method stub
		System.out.println("selectOneHistoryByHisNo Service >>>>");
		return historyDao.selectOneHistoryByHisNo(historyNo);
	}
	
	@Override
	public Map<String, Object> selectHistoryList() throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		/* 연혁 정보 */
		resultMap.put("history", historyDao.selectHistoryList());
		/* 기재 년도 조회 */
		resultMap.put("years", historyDao.selectYearList());
		/* 기재 월 조회 */
		resultMap.put("months", historyDao.selectMonthList());
		
		System.out.println("selectHistoryList Service resultMap>>>>" + resultMap);
		return resultMap;
	}

	@Override
	public int insertHistory(History history) {
		// TODO Auto-generated method stub
		return historyDao.insertHistory(history);
	}

	@Override
	public int updateHistory(History history) {
		// TODO Auto-generated method stub
		return historyDao.updateHistory(history);
	}

	@Override
	public int deleteHistory(int historyNo) {
		// TODO Auto-generated method stub
		return historyDao.deleteHistory(historyNo);
	}

	
	
}