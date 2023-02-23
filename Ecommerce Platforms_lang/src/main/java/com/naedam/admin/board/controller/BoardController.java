package com.naedam.admin.board.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.naedam.admin.board.model.service.BoardService;
import com.naedam.admin.board.model.vo.Board;
import com.naedam.admin.board.model.vo.BoardOption;
import com.naedam.admin.board.model.vo.Page;
import com.naedam.admin.board.model.vo.Post;
import com.naedam.admin.common.Comm;
import com.naedam.admin.common.Mir9Utils;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/board/*")
@Slf4j
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	int pageUnit = 5;
	int pageSize = 5;
	/***
	 * 게시판 DML 프로세스
	 * @param board
	 * @param boardAuthority
	 * @param boardOption
	 * @param mode
	 * @return /admin/board/listBoard.jsp
	 * @throws Exception
	 */
	@PostMapping("boardProcess")
	public String boardProcess(@ModelAttribute("board") Board board, 
							   @ModelAttribute("boardOption") BoardOption boardOption,
							   @RequestParam("mode") String mode) throws Exception {
		Map<String, Object> boardMap = new HashMap<>();
		boardMap.put("board", board);
		boardMap.put("boardOption", boardOption);
		boardMap.put("mode", mode);
		boardService.boardProcess(boardMap);
		return "redirect:/admin/board/listBoard?locale="+board.getLocale();
	}
	
	/***
	 * 게시판 => 게시글 DML 프로세스
	 * @param board
	 * @param post
	 * @param postName
	 * @param postName2 
	 * @param secNo
	 * @param mode
	 * @param request
	 * @return /admin/board/postList.jsp
	 * @throws Exception
	 */
	@PostMapping("postProcess")
	public String postProcess(@ModelAttribute("board") Board board, @ModelAttribute("post") Post post,
							  @RequestPart(value="postName", required = false) MultipartFile[] postName,   
							  @RequestParam("secNo") String secNo, 
							  @RequestParam("mode") String mode,
						      HttpServletRequest request) throws Exception {
		String filePath = request.getSession().getServletContext().getRealPath("resources/user/downloadFile/");
		
		Map<String, Object> postMap	 = new HashMap<>();
		postMap.put("board", board);
		postMap.put("post", post);	
		postMap.put("mode", mode);
		postMap.put("postName", postName);
		postMap.put("filePath", filePath);
		postMap.put("secNo", secNo);
		boardService.postProcess(postMap);
		return "redirect:/admin/board/postList?boardNo="+board.getBoardNo()+"&locale="+post.getLocale();
	}
	
	/***
	 * 게시판 리스트 조회
	 * @param search
	 * @param model
	 * @return admin/board/boardList.jsp
	 * @throws Exception
	 */
	@GetMapping("listBoard")
	public ModelAndView listBoard(@ModelAttribute("comm") Comm comm, Model model,
							@RequestParam(value = "locale", defaultValue = "ko") String locale) throws Exception {
		ModelAndView mv = new ModelAndView();
		//게시글 수
		//각 게시판마다 게시글 수가 필요하여 List로 게시글 수를 뽑아와 List에 add하는 방식
		//List postCount = new ArrayList();
		//게시판 리스트
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comm", comm);
		map.put("board", boardService.getBoardTitle(map));
		map.put("locale", locale);
		Map<String, Object> resultMap = boardService.getBoardList(map);
		Page resultPage = new Page( comm.getCurrentPage(), ((Integer)resultMap.get("totalCount")).intValue(), pageUnit, pageSize);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("recruitList", resultMap.get("recruitList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("comm", comm);
		model.addAttribute("postCount", resultMap.get("postCount"));
		model.addAttribute("locale", locale);
		mv.setViewName("admin/board/boardList");
		return mv;
	}
	
	/***
	 * 게시판 => 게시글 리스트 조회
	 * @param model
	 * @param request
	 * @param boardNo
	 * @param cPage
	 * @param search
	 * @return admin/board/postList.jsp
	 * @throws Exception
	 */
	@RequestMapping(value="postList")
	public String listPost(Model model, HttpServletRequest request ,
						   @RequestParam("boardNo") int boardNo, 
						   @RequestParam(defaultValue = "1") int cPage,
						   @RequestParam(value = "locale", defaultValue = "ko") String locale,
						   @ModelAttribute("comm") Comm comm) throws Exception {
		//게시글 리스트 수 limit 10으로
		int limit = 10;
		int offset = (cPage - 1) * limit;
		
		//게시글 리스트 옵션과 권한의 조건에 따라 태그를 생성해야 함
		Board board2 = boardService.getBoardAllData(boardNo);
		model.addAttribute("board2", board2);
		
		//게시글 리스트
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("comm", comm);
		map.put("boardNo", boardNo);
		map.put("limit", limit);
		map.put("offset", offset);
		map.put("locale", locale);
		Map<String, Object> resultMap = boardService.getPostList(map);
		int totalPostListCount = Integer.parseInt(resultMap.get("totalCount").toString());

		// pagebar
		String pagebar = Mir9Utils.getPagebar(cPage, limit, totalPostListCount, request.getRequestURI());
		model.addAttribute("comm",comm);
		model.addAttribute("pagebar", pagebar);		
		model.addAttribute("list", resultMap.get("list")); 
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("pageCount",totalPostListCount);
		model.addAttribute("locale", locale);
		return "admin/board/postList";
	}
	
	/***
	 * 게시판 => 게시글 => 게시글 상세보기 섬네일 삭제
	 * @param post
	 * @param boardNo
	 * @return admin/board/postList.jsp
	 * @throws Exception
	 */
	@PostMapping("deleteThombnail")
	public String deleteThombnail(@ModelAttribute("post") Post post,
								  @RequestParam("boardNo") int boardNo) throws Exception {
		System.out.println("deleteThombnail 시작");
		boardService.updateThombnail(post);
		return "redirect:/admin/board/postList?boardNo="+boardNo;
	}	
	
	/***
	 * 게시판 => 게시글 => 게시글 등록*수정 ckEditor 파일업로드
	 * @param request
	 * @param response
	 * @param multiFile
	 * @param upload
	 * @throws Exception
	 */
	@PostMapping("imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
							MultipartHttpServletRequest multiFile,
							@RequestPart(value="upload", required = false) MultipartFile upload) throws Exception{
		System.out.println("ckeditor 이미지 업로드 로그 확인");
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;
		if(upload.equals(null)) {
			System.out.println("null값 체크");
		}else {
			System.out.println("null값 체크2");
		}
		try{ 
			//파일 이름 가져오기 
			String fileName = upload.getOriginalFilename(); 
			byte[] bytes = upload.getBytes(); 
			//이미지 경로 생성 
			String path = request.getServletContext().getRealPath("resources/imgs/imageBoard/ckeditorImg/");
			// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다. 
			String ckUploadPath = path + uid + "_" + fileName; 
			File folder = new File(path); 
			//해당 디렉토리 확인 
			if(!folder.exists()){ 
				try{ folder.mkdirs(); // 폴더 생성 
				}catch(Exception e){ 
					e.getStackTrace(); 
				} 
			} 
			out = new FileOutputStream(new File(ckUploadPath)); 
			out.write(bytes); 
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화 
			String callback = request.getParameter("CKEditorFuncNum"); 
			printWriter = response.getWriter(); 
			String fileUrl = "/admin/board/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면 
			// 업로드시 메시지 출력 
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}"); 
			printWriter.flush(); 
			}catch(IOException e){ 
				e.printStackTrace(); 
			} finally { 
				try { 
					if(out != null) { 
						out.close(); 
					} 
					if(printWriter != null) { 
						printWriter.close(); 
					} 
				} catch(IOException e) { 
					e.printStackTrace(); 
				} 
			} return;
	}
	
	/***
	 * @param uid
	 * @param fileName
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="ckImgSubmit") 
	public void ckSubmit(@RequestParam(value="uid") String uid , 
						 @RequestParam(value="fileName") String fileName , 
						 HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		//서버에 저장된 이미지 경로 
		String path = request.getServletContext().getRealPath("resources/imgs/imageBoard/ckeditorImg/");
		String sDirPath = path + uid + "_" + fileName; 
		File imgFile = new File(sDirPath); 
		//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다. 
		if(imgFile.isFile()){ 
			byte[] buf = new byte[1024]; 
			int readByte = 0; 
			int length = 0; 
			byte[] imgBuf = null; 
			FileInputStream fileInputStream = null; 
			ByteArrayOutputStream outputStream = null; 
			ServletOutputStream out = null; 
			try{ 
				fileInputStream = new FileInputStream(imgFile); 
				outputStream = new ByteArrayOutputStream(); 
				out = response.getOutputStream(); 
				while((readByte = fileInputStream.read(buf)) != -1){ 
					outputStream.write(buf, 0, readByte); 
				} 
				imgBuf = outputStream.toByteArray(); 
				length = imgBuf.length; 
				out.write(imgBuf, 0, length); 
				out.flush(); 
			}catch(IOException e){ 	 
			}finally { 
				outputStream.close(); 
				fileInputStream.close(); 
				out.close(); 
			} 
		} 
	}

}

