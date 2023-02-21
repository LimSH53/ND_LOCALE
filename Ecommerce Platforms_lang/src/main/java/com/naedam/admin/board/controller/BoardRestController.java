package com.naedam.admin.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.naedam.admin.board.model.service.BoardService;
import com.naedam.admin.board.model.vo.Board;
import com.naedam.admin.board.model.vo.BoardComment;
import com.naedam.admin.board.model.vo.BoardFile;
import com.naedam.admin.board.model.vo.Post;
import com.naedam.admin.common.Comm;
import com.naedam.admin.member.model.vo.Member;
import com.naedam.admin.recruit.model.service.RecruitService;
import com.naedam.admin.setting.model.service.SettingService;
import com.naedam.admin.setting.model.vo.AdminMenu;

//게시판 관리의 Rest Controller
@RestController
@RequestMapping("/admin/board/*")
public class BoardRestController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private SettingService settingService;
	
	@Autowired
	private RecruitService recruitService;
	
	/***
	 * 게시판 => 게시글 => 게시글 댓글 달기
	 * @param boardComment
	 * @throws Exception
	 */
	//댓글 달기
	@PostMapping(value="json/addComment")
	public void addComment(@RequestBody BoardComment boardComment)throws Exception{
		Member member = boardService.getMemberData(boardComment.getCommentMemberNo());
		boardComment.setCommentWriter(member.getLastName()+member.getFirstName());
		boardService.addComment(boardComment);
	}
	
	/***
	 * 대용량 파일 업로드
	 * @param file
	 * @param request
	 * @return
	 * @throws Exception
	 */
	//대용량 파일 업로드
	@PostMapping(value="json/plupload")
	public String plupload(@RequestParam("file") MultipartFile file, HttpServletRequest request)throws Exception{
		System.out.println("/json/plupload 시작");
		String a = file.getOriginalFilename();
		String filePath = request.getServletContext().getRealPath("resources/admin/imgs/imageBoard/board");
		File file2 = new File(filePath+file.getOriginalFilename());
		file.transferTo(file2);
		return a;
	}	
	
	/***
	 * 사이드 바, 게시물 복사, 이전의 제목을 위한 데이터 
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/listBoard")
	public List<Board> listBoard() throws Exception{		
		return boardService.getBoardTitle();
	}
	
	/***
	 * 해당 게시판의 게시글을 불러오는 리스트
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/getPostList/{boardNo}")
	public Map<String, Object> getPostList(@PathVariable("boardNo") int boardNo) throws Exception{
		System.out.println("getPostList boardNo==== "+ boardNo);
		//조회 전 마감일자 지난 list들 채용마감으로 변경
		recruitService.updateContentsStatus();
		Board board = new Board();
		Comm comm = new Comm();
		board.setBoardNo(boardNo);
		
		int limit = 5;
		int offset = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("comm", comm);
		map.put("limit", limit);
		map.put("offset", offset);
		Map<String, Object> resultMap = boardService.getPostList(map);
		return resultMap;
	}	
	
	/***
	 * 게시판의 모든 데이터 확인을 위한 메소드
	 * @param boardNo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/getBoardAllData/{boardNo}")
	public Board getBoardAllData(@PathVariable("boardNo") int boardNo, Model model) throws Exception{
		return boardService.getBoardAllData(boardNo);
	}
	
	/***
	 * 게시글 작성 때 필요한 Session값의 User 데이터
	 * @param secNo
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/getMemberData/{secNo}")
	public Member getMemberData(@PathVariable("secNo") int secNo) throws Exception{
		return boardService.getMemberData(secNo);
	}
	
	/***
	 * 게시글 정보 조회
	 * @param postNo
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/getPostData/{postNo}")
	public Post getPostData(@PathVariable("postNo") int postNo)throws Exception{
		return boardService.getPostData(postNo);
	}
	
	/***
	 * 회원정보 조회
	 * @param memberNo
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/getMemberData2/{memberNo}")
	public Member getMemberData2(@PathVariable("memberNo") int memberNo) throws Exception{
		System.out.println("getMemberData2 시작");
		return boardService.getMemberData(memberNo);
	}
	
	/***
	 * 댓글 리스트 조회
	 * @param postNo
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/getCommentList/{postNo}")
	public List<BoardComment> getCommentList(@PathVariable("postNo") int postNo) throws Exception{
		System.out.println("json/getCommentList 시작");
		List<BoardComment> boardComment = boardService.getCommentList(postNo);
		return boardComment;
	}
	
	/***
	 * 게시글 파일 조회
	 * @param postNo
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/getPostFile/{postNo}")
	public List<BoardFile> getPostFile(@PathVariable("postNo") int postNo) throws Exception{
		List<BoardFile> boardFile =  boardService.getPostFile(postNo);
		return boardFile;
	}
	
	/***
	 * 비동기처리의 C,U,D를 위한 게시판 프로세스
	 * @param boardArr
	 * @param mode
	 * @return
	 * @throws Exception
	 */
	@PostMapping("json/boardProcess")
	public Boolean boardProcess(@RequestParam(value = "boardArr[]") List<String> boardArr,  @RequestParam("mode") String mode) throws Exception{
		Boolean result = false;
		Map<String, Object> boardMap = new HashMap<>();
		boardMap.put("boardArr", boardArr);
		boardMap.put("mode", mode);
		boardService.boardProcess(boardMap);
		result = true;
		return result;
	}	
	
	/***
	 * 비동기처리의 C,U,D를 위한 게시글 프로세스
	 * @param postArr
	 * @param boardNo
	 * @param mode
	 * @return
	 * @throws Exception
	 */
	@PostMapping("json/postProcess")
	public Boolean postProcess(@RequestParam(value = "postArr[]") List<String> postArr,
							   @RequestParam(value = "boardNo", required = false, defaultValue= "0") int boardNo,
							   @RequestParam("mode") String mode) throws Exception{
		Post post = new Post();
		Boolean result = false;
		Map<String, Object> postMap = new HashMap<>();
		postMap.put("postArr", postArr);
		postMap.put("mode", mode);
		postMap.put("boardNo", boardNo);
		postMap.put("post", post);
		boardService.postProcess(postMap);
		result = true;
		return result;
	}	
	
	/***
	 * 게시글에 등록되어있는 파일을 삭제할 수 있는 메소드
	 * @param fileNo
	 * @throws Exception
	 */
	@GetMapping(value="json/deleteFile/{fileNo}")
	public void deleteFile(@PathVariable("fileNo") int fileNo) throws Exception{
		boardService.deleteFile(fileNo);
	}
	
	/***
	 * 댓글 삭제
	 * @param commentNo
	 * @throws Exception
	 */
	@GetMapping(value="json/deleteComment/{commentNo}")
	public void deleteComment(@PathVariable("commentNo") int commentNo) throws Exception{
		boardService.deleteComment(commentNo);
	}
	
	/***
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="json/getAdminMenu")
	public List<AdminMenu> getAdminMenu() throws Exception{
		System.out.println("json/getAdminMenu 시작");
		List<AdminMenu> adminMenu = settingService.selectAdminMenuList();
		return adminMenu;
	}
	
	@GetMapping(value="json/downloadImg/{fileNo}")
	public void download(HttpServletResponse response, @PathVariable("fileNo") int fileNo) throws Exception {
		System.out.println("json/downloadImg 시작");
		BoardFile boardFile = boardService.getFileData(fileNo);
		
        // 직접 파일 정보를 변수에 저장해 놨지만, 이 부분이 db에서 읽어왔다고 가정한다.
		String fileName = boardFile.getFileName();
		String saveFileName = "C:\\Users\\user\\git\\mir9\\src\\main\\webapp\\resources\\imgs\\imageBoard\\board"+fileName;
		String contentType = "image/jpg";
        File file = new File(saveFileName);
        long fileLength = file.length();

        //파일의 크기와 같지 않을 경우 프로그램이 멈추지 않고 계속 실행되거나, 잘못된 정보가 다운로드 될 수 있다.

        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");

        try(
                FileInputStream fis = new FileInputStream(saveFileName);
                OutputStream out = response.getOutputStream();
        ){
                int readCount = 0;
                byte[] buffer = new byte[1024];
                while((readCount = fis.read(buffer)) != -1){
                    out.write(buffer,0,readCount);
                }
        }catch(Exception ex){
            throw new RuntimeException("file Save Error");
        }
	}
	
	/***
	 * 게시글 순서 변경 (위)	
	 * @param boardAsc
	 * @param boardUpAsc
	 * @param postNo
	 * @param upPostNo
	 * @return
	 * @throws Exception
	 */
	@PostMapping("json/updateUpAsc")
	public Boolean updateUpAsc(@RequestParam("boardAsc") int boardAsc,
							@RequestParam("boardUpAsc") int boardUpAsc,
							@RequestParam("postNo") int postNo,
							@RequestParam("upPostNo") int upPostNo) throws Exception{
		System.out.println("updateUpAsc 시작");
		Boolean result = false;
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map.put("boardUpAsc", boardUpAsc);
		map.put("upPostNo", postNo);
		map2.put("boardUpAsc", boardAsc);
		map2.put("upPostNo", upPostNo);
		boardService.updateUpAsc(map);
		boardService.updateUpAsc(map2);
		result = true;
		return result;
	}
	
	/***
	 * 게시글 순서 변경 (아래)
	 * @param boardAsc
	 * @param boardDownAsc
	 * @param postNo
	 * @param downPostNo
	 * @return
	 * @throws Exception
	 */
	@PostMapping("json/updateDownAsc")
	public Boolean updateDownAsc(@RequestParam("boardAsc") int boardAsc,
							@RequestParam("boardDownAsc") int boardDownAsc,
							@RequestParam("postNo") int postNo,
							@RequestParam("downPostNo") int downPostNo) throws Exception{
		System.out.println("json/updateDownAsc 시작");
		Boolean result = false;
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map.put("boardDownAsc", boardDownAsc);
		map.put("downPostNo", postNo);
		map2.put("boardDownAsc", boardAsc);
		map2.put("downPostNo", downPostNo);
		boardService.updateDownAsc(map);
		boardService.updateDownAsc(map2);
		result = true;
		return result;
	}
	
	
	@PostMapping("json/testtest")
	public Boolean testInsert(@RequestParam("formData") Map<String, Object> map) {
		Boolean result = false;
		System.out.println("map ==== "+map);
		
		return result;
	}
	
}







