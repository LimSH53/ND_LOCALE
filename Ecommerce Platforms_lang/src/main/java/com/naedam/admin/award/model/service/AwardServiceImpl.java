package com.naedam.admin.award.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.award.model.dao.AwardDao;
import com.naedam.admin.award.model.vo.Award;
import com.naedam.admin.menu.model.vo.Head;

@Service
public class AwardServiceImpl implements AwardService {

	@Autowired
	private AwardDao awardDao;
	
	@Override
	public Map<String, Object> awardProcess(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<>();
		Award award = (Award) map.get("award");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String filePath = request.getServletContext().getRealPath("resources/user/images/company/award/");
		System.out.println("경로==="+filePath);
		MultipartFile awardImage = (MultipartFile) map.get("awardImage");
		if("insert".equals(map.get("mode")) || "update".equals(map.get("mode"))) {
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
			award.setAwardDate(date);
			if("insert".equals(map.get("mode"))) {
				File file = new File(filePath+awardImage.getOriginalFilename());
				award.setImgUrl(awardImage.getOriginalFilename());
				awardImage.transferTo(file);
				awardDao.insertAward(award);
				resultMap.put("msg", "연혁 정보가 등록되었습니다.");
			}else if("update".equals(map.get("mode"))) {
				if(awardImage.isEmpty() == false) {
					File file = new File(filePath+awardImage.getOriginalFilename());
					award.setImgUrl(awardImage.getOriginalFilename());
					awardImage.transferTo(file);
				}else if(awardImage.isEmpty() == true) {
					Award awardData = awardDao.selectDetailByNo(award.getAwardNo());
					award.setImgUrl(awardData.getImgUrl());
				}
				
				awardDao.updateAward(award);
				resultMap.put("msg", "연혁 정보가 수정되었습니다.");
			}
		}else if("delete".equals(map.get("mode"))) {
			List<String> historyNoList = Arrays.asList(request.getParameterValues("list[]"));
			for(String no : historyNoList) {
				awardDao.deleteAward(Integer.parseInt(no));
			}
			resultMap.put("msg", "연혁이 삭제되었습니다.");
		}
		
		return resultMap;
	}

	public void insertAward(Award award) {
		// TODO Auto-generated method stub
		awardDao.insertAward(award);
	}

	@Override
	public void updateAward(Award award) {
		// TODO Auto-generated method stub
		awardDao.updateAward(award);
	}

	@Override
	public void deleteAward(int awardNo) {
		// TODO Auto-generated method stub
		awardDao.deleteAward(awardNo);
	}


	@Override
	public Award selectDetailByNo(int awardNo) {

		return awardDao.selectDetailByNo(awardNo);
	}

	@Override
	public Map<String, Object> selectAwardList() throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> awardmap = new HashMap<String, Object>();
		awardmap.put("award", awardDao.selectAwardList());
		awardmap.put("awardYears", awardDao.SelectYear());
		awardmap.put("awardMonths", awardDao.SelectMonth());
		
		return awardmap;
	}



	
}
