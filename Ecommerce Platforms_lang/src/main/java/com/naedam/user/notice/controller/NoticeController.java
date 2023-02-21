package com.naedam.user.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.naedam.admin.board.model.service.BoardService;
import com.naedam.admin.board.model.vo.Board;
import com.naedam.admin.board.model.vo.Post;
import com.naedam.admin.common.Comm;
import com.naedam.admin.common.NaedamUtils;

@Controller
@RestController
@RequestMapping("/user/notice/*")
public class NoticeController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="noticeList/{boardNo}")
	public ModelAndView noticeList(HttpServletRequest request,
								   @PathVariable("boardNo") int boardNo, 
								   @RequestParam(defaultValue = "1") int cPage,
								   @ModelAttribute("comm") Comm comm) throws Exception{
		//게시글 리스트 수 limit 10으로
		int limit = 8;
		int offset = (cPage - 1) * limit;
		
		ModelAndView mv = new ModelAndView();
		//게시글 리스트 옵션과 권한의 조건에 따라 태그를 생성해야 함
		Board board2 = boardService.getBoardAllData(boardNo);
		mv.addObject("board2", board2);
		//게시글 리스트
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comm", comm);
		map.put("boardNo", boardNo);
		map.put("limit", limit);
		map.put("offset", offset);
		List<Post> postlist = boardService.getUserPostList(map);
		Map<String, Object> resultMap = boardService.getPostList(map);
		int totalPostListCount = Integer.parseInt(resultMap.get("totalCount").toString());
		
		// pagebar
		String pagebar = NaedamUtils.getPagebar(cPage, limit, totalPostListCount, request.getRequestURI());
		
		mv.addObject("pagebar", pagebar);		
		mv.addObject("list", postlist); 
		mv.addObject("boardNo", boardNo);
		mv.addObject("pageCount",totalPostListCount);		
		mv.setViewName("user/notice/noticeList");
		return mv;
	}
	
	@RequestMapping(value="noticeListCom")
	public Map<String, Object> noticeListCom(HttpServletRequest request, 
											 @RequestParam(value = "cPage", defaultValue = "1") int cPage,
											 @RequestParam("boardNo") int boardNo,
											 @RequestParam("searchKeyword") String searchKeyword,
											 @RequestParam("searchType") String searchType) throws Exception{
		int limit = 8;
		int offset = (cPage - 1) * limit;
		Comm comm = new Comm();
		comm.setSearchKeyword(searchKeyword);
		comm.setSearchType(searchType);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comm", comm);
		map.put("boardNo", boardNo);
		map.put("limit", limit);
		map.put("offset", offset);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Post> postlist = boardService.getUserPostList(map);
		int totalPostListCount = boardService.getUserGetTotalCount(map);
		// pagebar
		String pagebar = NaedamUtils.getPagebar(cPage, limit, totalPostListCount, request.getRequestURI());
		resultMap.put("list", postlist);
		resultMap.put("pagebar", pagebar);
		return resultMap;
	}
	
	@RequestMapping(value="getNoticeDetail/{postNo}")
	public ModelAndView getNoticeDetail(@PathVariable("postNo") int postNo) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("postNo", postNo);
		Map<String, Object> resultMap = boardService.getNoticeDetail(map);
		mv.addObject("post",resultMap.get("post"));
		mv.addObject("board",resultMap.get("board"));
		mv.addObject("boardFile", resultMap.get("boardFile"));
		mv.addObject("postPrev",resultMap.get("postPrev"));
		mv.addObject("postNext",resultMap.get("postNext"));
		mv.setViewName("user/notice/noticeDetail");
		return mv;
	}
	
	@RequestMapping(value="noticeList_temp")
	public ModelAndView noticeList_temp(Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/notice/getNotice");
		return mv;
	}
	
}
