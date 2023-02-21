package com.naedam.admin.recruit.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.naedam.admin.common.Mir9Utils;
import com.naedam.admin.recruit.model.service.RecruitService;
import com.naedam.admin.recruit.model.vo.recruitContentsDTO;
import com.naedam.admin.recruit.model.vo.recruitDTO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class RecruitController {

	@Autowired
	private RecruitService recruitService;
	
	//채용번호
	private int curRecruitNo;

	// 채용 게시글 조회
	@RequestMapping("recruitList")
	public String recruitList(Model model, @RequestParam(defaultValue = "1") int cPage, HttpServletRequest request,
			@RequestParam(value= "searchKeyword",required = false) String searchKeyword) throws Exception {
		System.out.println("recruitList start =======");
		//조회 전 마감일자 지난 list들 채용마감으로 변경
		int update = recruitService.updateContentsStatus();
		
		// 게시글 조회 한도
		int limit = 10;
		int offset = (cPage - 1) * limit;

		// 게시글 리스트
		Map<String, Object> resultMap = recruitService.getRecruitList(searchKeyword, limit, offset);

		// 게시글 총 갯수
		int totalRecruitListCount = Integer.parseInt(resultMap.get("totalCount").toString());

		// 페이징 처리
		String url = request.getRequestURI();
		String pagebar = Mir9Utils.getPagebar(cPage, limit, totalRecruitListCount, url);
		
		System.out.println("list======> " + resultMap.get("list"));
		
		model.addAttribute("pagebar", pagebar);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("pageCount", totalRecruitListCount);
		model.addAttribute("searchKeyword", searchKeyword);
		
		System.out.println("resultMap.get(\"list\")" + resultMap.get("list"));

		return "admin/recruit/recruitList";

	}
	
	@PostMapping("deleteRecruit")
	@ResponseBody
	public String deleteRecruit(@RequestParam(value = "postArr[]") List<Integer> postArr) {

		int deleteResult = recruitService.deleteRecruit(postArr);

		if (deleteResult == postArr.size()) {
			System.out.println("게시글이 삭제 되었습니다.");
		} else {
			System.out.println("게시글이 삭제 되었습니다." + deleteResult);
		}

		return null;

	}

	@PostMapping(value = "insertRecruit" , produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String insertRecruit(@ModelAttribute recruitDTO recruit,
			@RequestParam(value = "subTitle[]", required = false)List<String> subTitle,
			@RequestParam(value = "contents[]", required = false)List<String> contents) {
	
		int recruitRecult = 0;
		
		// 채용 게시글 입력
		recruitRecult = recruitService.insertRecruit(recruit);
		
		// 채용 게시글 번호
		curRecruitNo = recruit.getRecruitNo();
		
		int insertResult = 0;
		
		if(subTitle != null) {
			// 상세내용 추가 입력
			insertResult = recruitService.insertRecruitContents(subTitle, contents, curRecruitNo);
		}					
		log.info("insertResult >>> " + insertResult);

		if(recruitRecult == 1) {
			System.out.println("recruitRecult == 1");
			if(subTitle != null) {
				// 채용게시글 상세내용 등록 확인
				if(insertResult == subTitle.size()) {
					System.out.println("insertResult == subTitleSize");
				} else {
					System.out.println("insertResult 실패");
				}
			}
		} else {
			System.out.println("recruitRecult 실패");
		}
		
		return null;
	}
	
	@PostMapping(value = "insertFile")
	@ResponseBody
	public int insertFile(@RequestParam(value = "file", required = false) List<MultipartFile> fileList,
			HttpServletRequest request) {

		System.out.println("insertFile curRecruitNo>>>>>" + curRecruitNo);
		System.out.println("insertFile fileList1>>>>>" + fileList);
		System.out.println("fileList.size() >>>" + fileList.size());
		
		int fileResult = recruitService.insertFile(fileList, request, curRecruitNo);
		
		int result;
		
		if(fileResult == 1) {
			result = 1;	
		} else if(fileResult == 0){
			result = 2;
		} else {
			result = 3;
		}

		return result;
	}
	
	@GetMapping("getRecruitData")
	@ResponseBody
	public Map<String, Object> getRecruitData(Model model,@RequestParam("postNo") int recruitNo) {
		System.out.println("======= getRecruitData 실행 =========");
		
		//채용글 1차
		recruitDTO recruitData = recruitService.getRecruitData(recruitNo);
		
		//채용글 2차 (리스트 여러개)
		List<recruitContentsDTO> contents = recruitService.getContentsData(recruitNo);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		resultMap.put("recruitData", recruitData);
		resultMap.put("contents", contents);
	
		
		return resultMap;
	}
	
	
	@PostMapping(value = "updateRecruit", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String updateRecruit(@ModelAttribute recruitDTO recruit,
			@RequestParam(value = "subTitle[]", required = false)List<String> subTitle,
			@RequestParam(value = "contents[]", required = false)List<String> contents) throws Exception {

		int recruitResult = 0;
		String msg="";
		
		curRecruitNo = recruit.getRecruitNo();
		
		// 채용 게시글 업데이트
		recruitResult = recruitService.updateRecruit(recruit);

		System.out.println("curRecruitNo === " + curRecruitNo);

		//업데이트를 위해 상세 내용 삭제
		int deleteResult = recruitService.deleteRecruitContents(curRecruitNo);
		System.out.println("삭제 상태 ====== " + deleteResult );
		
		// 채용 상세 내용 업데이트
		System.out.println("subTitle >>>" + contents);
		int insertResult = recruitService.insertRecruitContents(subTitle, contents, curRecruitNo);

		//채용 게시글 등록 완료 확인
		if(recruitResult == 1) {
			System.out.println("recruitRecult == 1");
			if(subTitle != null) {
				// 채용게시글 상세내용 등록 확인
				if(insertResult == subTitle.size()) {
					System.out.println("insertResult == subTitleSize");
				} else {
					System.out.println("insertResult 실패");
				}
			}
		} else {
			System.out.println("recruitRecult 실패");
		}

		return null;

	}

}
