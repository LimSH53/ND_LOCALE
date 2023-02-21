package com.naedam.admin.business.model.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.board.model.dao.BoardDao;
import com.naedam.admin.board.model.vo.BoardFile;
import com.naedam.admin.business.model.dao.BusinessDao;
import com.naedam.admin.business.model.vo.Business;
import com.naedam.admin.business.model.vo.BusinessContents;
import com.naedam.admin.business.model.vo.BusinessPost;
import com.naedam.admin.member.model.vo.Member;


@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	private BusinessDao businessDao;
	@Autowired
	private BoardDao boardDao;
	

	public void businessProcess(Map<String, Object> map) throws Exception{
		Business business = (Business) map.get("business");
		if("insert".equals(map.get("mode"))) {
			businessDao.addBusiness(business);
		}else if("update".equals(map.get("mode"))) {
			businessDao.updateBusiness(business);
		}else if("delete".equals(map.get("mode"))) {
			List<Integer> businessArr = (List<Integer>) map.get("businessArr");
			businessDao.deleteChoiceBusiness(businessArr);
		}
	}
	
	public void businessPostProcess(Map<String, Object> map) throws Exception{
		BusinessPost businessPost = (BusinessPost) map.get("businessPost");
		BoardFile boardFile = new BoardFile();
		if("insert".equals(map.get("mode")) || "update".equals(map.get("mode"))) {
			businessPost.setBusiness((Business) map.get("business"));
			Member member = boardDao.getMemberData(Integer.parseInt(map.get("secNo").toString()));
			businessPost.setBusinessMember(member);
			//파일 업로드 한개 이상 업로드가 가능하여 배열로 가져와서 업로드 로직 실행
			MultipartFile iconName = (MultipartFile) map.get("icon");
			MultipartFile imgName = (MultipartFile) map.get("img");
			
			if("insert".equals(map.get("mode"))) {
				if(iconName.isEmpty() == false){
					businessPost.setBusinessPostIcon(iconName.getOriginalFilename());
					File file = new File(map.get("filePath")+iconName.getOriginalFilename());
					iconName.transferTo(file);	
				}
				if(imgName.isEmpty() == false){
					businessPost.setBusinessPostImg(imgName.getOriginalFilename());
					File file = new File(map.get("filePath2")+imgName.getOriginalFilename());
					imgName.transferTo(file);	
				}
				businessDao.addBusinessPost(businessPost);
			}else if("update".equals(map.get("mode"))) {
				if(iconName.isEmpty() == false) {
					File file = new File(map.get("filePath")+iconName.getOriginalFilename());
					businessPost.setBusinessPostIcon(iconName.getOriginalFilename());
					iconName.transferTo(file);
				}else if(iconName.isEmpty() == true) {
					BusinessPost bp = businessDao.getBusinessPost(businessPost.getBusinessPostNo());
					businessPost.setBusinessPostIcon(bp.getBusinessPostIcon());
				}
				if(imgName.isEmpty() == false) {
					File file = new File(map.get("filePath2")+imgName.getOriginalFilename());
					businessPost.setBusinessPostImg(imgName.getOriginalFilename());
					imgName.transferTo(file);
				}else if(imgName.isEmpty() == true) {
					BusinessPost bp = businessDao.getBusinessPost(businessPost.getBusinessPostNo());
					businessPost.setBusinessPostImg(bp.getBusinessPostImg());
				}
				businessDao.updateBusinessPost(businessPost);
			}
		}else if("delete".equals(map.get("mode"))) {
			List<Integer> businessPostArr = (List<Integer>) map.get("businessPostArr");
			businessDao.deleteChoiceBusinessPost(businessPostArr);
		}
	}
	
	public void businessContentsProcess(Map<String, Object> map) throws Exception{
		BusinessContents businessContents = (BusinessContents) map.get("businessContents");
		if("insert".equals(map.get("mode")) || "update".equals(map.get("mode"))) {
			businessContents.setBusinessPost((BusinessPost) map.get("businessPost"));
			MultipartFile imageName = (MultipartFile) map.get("file");
			if("insert".equals(map.get("mode"))) {
				if(imageName.isEmpty() == false){
					System.out.println("확입합시다.");
					File file = new File(map.get("filePath")+imageName.getOriginalFilename());
					imageName.transferTo(file);
					businessContents.setImage(imageName.getOriginalFilename());
				}
				businessDao.addBusinessContents(businessContents);
			}else if("update".equals(map.get("mode"))) {
				if(imageName.isEmpty() == false) {
					File file = new File(map.get("filePath")+imageName.getOriginalFilename());
					businessContents.setImage(imageName.getOriginalFilename());
					imageName.transferTo(file);
				}else if(imageName.isEmpty() == true) {
					BusinessContents bp = businessDao.getBusinessContents(businessContents.getBusinessContentsNo());
					businessContents.setImage(bp.getImage());
				}
				System.out.println("확인 === "+businessContents);
				businessDao.updateBusinessContents(businessContents);
			}
		}
		else if("delete".equals(map.get("mode"))) {
			List<Integer> businessContentsArr = (List<Integer>) map.get("businessContentsArr");
			businessDao.deleteChoiceBusinessContents(businessContentsArr);
		}
	}
	
	@Override
	public Business getBusiness(int businessNo) throws Exception {
		return businessDao.getBusiness(businessNo);
	}
	
	@Override
	public BusinessPost getBusinessPost(int businessPostNo) throws Exception {
		return businessDao.getBusinessPost(businessPostNo);
	}
	
	@Override
	public Map<String, Object> getBusinessList(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", businessDao.getBusinessList(map));
		return resultMap;
	}

	@Override
	public List<BusinessPost> getBusinessPostList(Map<String, Object> map) throws Exception {
		return businessDao.getBusinessPostList(map);
	}

	@Override
	public List<BusinessPost> getBusinessPostAllList() throws Exception {
		return businessDao.getBusinessPostAllList();
	}
	
	@Override
	public List<BusinessContents> getBusinessContentsList(Map<String, Object> map) throws Exception{
		return businessDao.getBusinessContentsList(map);
	}

	@Override
	public BusinessContents getBusinessContents(int businessPostNo) throws Exception {
		return businessDao.getBusinessContents(businessPostNo);
	}

}