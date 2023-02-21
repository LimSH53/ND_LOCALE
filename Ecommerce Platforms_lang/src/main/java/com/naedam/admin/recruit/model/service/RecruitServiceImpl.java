package com.naedam.admin.recruit.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.recruit.model.dao.RecruitDao;
import com.naedam.admin.recruit.model.vo.recruitContentsDTO;
import com.naedam.admin.recruit.model.vo.recruitDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RecruitServiceImpl implements RecruitService {

	@Autowired
	private RecruitDao recruitDao;

	@Override
	public Map<String, Object> getRecruitList(String search, int limit, int offset) throws Exception {
		
		System.out.println("==========recruitList service =================");
		System.out.println("search>>>" + search);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", recruitDao.getRecruitList(search, offset, limit));
		resultMap.put("totalCount", recruitDao.getTotalCount(search));
		
		return resultMap;
	}

	@Override
	public int deleteRecruit(List<Integer> postArr) {
		
		int recruitNum;
		int deleteResult = 0;

		for (int i = 0; i < postArr.size(); i++) {
			recruitNum = postArr.get(i);
			System.out.println("recruitNum" + i + ">>>>>" + recruitNum);
			deleteResult += recruitDao.deleteRecruit(recruitNum);
		};
		
		return deleteResult;
	}

	@Override
	public int insertRecruit(recruitDTO recruit) {
		
		log.info(">>>>>insertRecruitService 실행");
		
		int recruitResult = recruitDao.insertRecruit(recruit);
		
		System.out.println(">>>> recruitRecult: " + recruitResult);
		
		return recruitResult;
	}
	
	@Override
	public int insertFile(List<MultipartFile> fileList, HttpServletRequest request, int curRecruitNo) {
		
		recruitDTO recruit = new recruitDTO();
		int fileResult = 0;
		
		if(!fileList.isEmpty() || fileList.size() > 0) {
			
			//오리지널 이름 저장
			recruit.setOrgFileName(fileList.get(0).getOriginalFilename());
			//파일 식별자 처리를 위한 UUID
			UUID uuid = UUID.randomUUID();
			//fileName 처리 후 저장
			String fileName = uuid + "_" + fileList.get(0).getOriginalFilename();
			recruit.setFileName(fileName);
			//파일 저장을 위한 filePath
			String filePath = request.getServletContext().getRealPath("resources/imgs/imgrecruit/");
			
			//cafe24 적용을 위해..
			String filePath2 ="resources/imgs/imgrecruit/";
			recruit.setFilePath(filePath2);
			
			//파일 저장
			File saveFile = new File(filePath,fileName);
			try {
				fileList.get(0).transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			recruit.setRecruitNo(curRecruitNo);
			
			fileResult = recruitDao.insertFile(recruit);
			
		}
		
		if(fileList.size() == 0) {
			fileResult = recruitDao.deleteFile(curRecruitNo);
		}

		return fileResult;
	}

	@Override
	public int insertRecruitContents(List<String> subTitle, List<String> contents, int curRecruitNo) {
		/* 리스트 생성 */
		List<recruitContentsDTO> contentsList = new ArrayList<>();
		int subTitleSize = 0;
		
		System.out.println("contents List >>>>" + contents);
		
		if(subTitle != null) {
			subTitleSize = subTitle.size();
		}
		
		//contentsList Dao로 전달
		int insertContentsResult = 0;
				
		//contentsList에 내용 넣기
		if(subTitleSize == 1) {
			recruitContentsDTO dtoContents = new recruitContentsDTO();
			
			String subTitleStr = String.join(",", subTitle);
			String contentsStr = String.join(",", contents);
			System.out.println("subTitleStr>>>>>>>" + subTitleStr);
			System.out.println("contentsStr>>>>>>>" + contentsStr);
			
			/*세부 내용*/
			dtoContents.setRecruitSubTitle(subTitleStr);
			dtoContents.setRecruitContents(contentsStr);
					
			/*세부 내용이 들어갈 채용 게시글 dto*/
			recruitDTO dtoRecruit = new recruitDTO();
			dtoRecruit.setRecruitNo(curRecruitNo);
			dtoContents.setRecruitNo(dtoRecruit);
					
			insertContentsResult = recruitDao.insertRecruitContents(dtoContents);
			
		} else {
			for (int i = 0; i < subTitleSize; i++) {
				System.out.println("i >> " + i);
				recruitContentsDTO dtoContents = new recruitContentsDTO();
						
				/*세부 내용*/
				dtoContents.setRecruitSubTitle(subTitle.get(i));
				dtoContents.setRecruitContents(contents.get(i));
				System.out.println("contents.get(i)>>>>>>" + contents.get(i));
						
				/*세부 내용이 들어갈 채용 게시글 dto*/
				recruitDTO dtoRecruit = new recruitDTO();
				dtoRecruit.setRecruitNo(curRecruitNo);
				dtoContents.setRecruitNo(dtoRecruit);
						
				contentsList.add(dtoContents);
						  
				System.out.println("contents [" + i + "] >> " + contentsList);
			}
			
			for(int i = 0; i < contentsList.size(); i++) {
				insertContentsResult += recruitDao.insertRecruitContents(contentsList.get(i));
				System.out.println("contentsList.get(" + i + ") ==>" + contentsList.get(i));
			}
		}
		
		
		
		return insertContentsResult;
	}

	@Override
	public recruitDTO getRecruitData(int recruitNo) {
		System.out.println("getRecruitData Service ==== " + recruitNo);
		return recruitDao.getRecruitData(recruitNo);
	}

	@Override
	public List<recruitContentsDTO> getContentsData(int recruitNo) {
		System.out.println("getContentsData Service ==== " + recruitNo);
		return recruitDao.getContentsData(recruitNo);
	}

	@Override
	public int updateRecruit(recruitDTO recruit) {
		System.out.println("updateRecruit Service ==== " + recruit);
		return recruitDao.updateRecruit(recruit);
	}

	@Override
	public int deleteRecruitContents(int curRecruitNo) {
		System.out.println("deleteRecruitContents Service ==== " + curRecruitNo);
		return recruitDao.deleteRecruitContents(curRecruitNo);
	}

	@Override
	public int updateContentsStatus() {
		System.out.println("updateContentsStatus service ====");
		return recruitDao.updateContentsStatus();
	}

	

	

	
	
	
}
