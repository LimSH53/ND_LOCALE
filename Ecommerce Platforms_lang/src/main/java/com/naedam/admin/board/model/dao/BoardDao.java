package com.naedam.admin.board.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.admin.board.model.vo.Board;
import com.naedam.admin.board.model.vo.BoardAuthority;
import com.naedam.admin.board.model.vo.BoardComment;
import com.naedam.admin.board.model.vo.BoardFile;
import com.naedam.admin.board.model.vo.BoardOption;
import com.naedam.admin.board.model.vo.BoardTranslate;
import com.naedam.admin.board.model.vo.Post;
import com.naedam.admin.member.model.vo.Member;

public interface BoardDao {
	
	//게시판 등록
	public void addBoard(Board board) throws Exception;
	
	//게시글 등록
	public int addPost(Post post) throws Exception;
	
	//게시글 답변 등록
	public int addAnswerPost(Post post) throws Exception;
	
	//게시판 등록의 권한
	public int addAuthority(BoardAuthority boardAuthority) throws Exception;
	
	//게시판 등록의 옵션
	public int addOption(BoardOption boardOption) throws Exception;
	
	//게시판 등록의 번역
	public int addTranslate(BoardTranslate boardTranslate) throws Exception;
	
	//게시글 파일 등록
	public int addFile(BoardFile boardFile) throws Exception;
	
	//댓글 등록
	public int addComment(BoardComment boardComment) throws Exception;
	
	//게시판 목록
	public List<Board> getBoardList(Map<String, Object> map) throws Exception;
	
	//게시판 목록의 수
	public int getTotalCount(Map <String, Object> map) throws Exception;
	
	//게시글 목록
	public List<Post> getPostList(Map<String, Object> map) throws Exception;
	
	//사용자 게시글 목록
	public List<Post> getUserPostList(Map<String, Object> map) throws Exception;
	
	//메인페이지 공지사항 최신 3개 목록
	public List<Post> getMainPostList() throws Exception;
	
	//게시글의 파일 데이터
	public List<BoardFile> getPostFile(int postNo) throws Exception;
	
	//댓글 목록
	public List<BoardComment> getCommentList(int postNo) throws Exception;
	
	//파일 데이터
	public BoardFile getFileData(int fileNo) throws Exception;
	
	//게시글 수
	public int getTotalCount2(Map <String, Object> map) throws Exception;
	
	//게시판 등록 글 수
	public int getTotalCount3(int boardNo) throws Exception;
	
	//header의 게시판 제목
	public List<Board> getBoardTitle();
	
	//게시판의 데이터
	public Board getBoardData(int boardNo) throws Exception;
	
	//게시글의 데이터
	public Post getPostData(int postNo) throws Exception;
	
	//게시글 이전 데이터
	public Post getPrevPost(Post post) throws Exception;
	
	//게시글 이전 데이터
	public Post getNextPost(Post post) throws Exception;
	
	//게시판의 모든 데이터
	public Board getBoardAllData(int boardNo) throws Exception;
	
	//회원의 데이터
	public Member getMemberData(int memberNo) throws Exception;
	
	//게시판 선택 삭제
	public void deleteChoiceBoard(List<Integer> boardNo) throws Exception;
	
	//게시글 선택 삭제
	public void deleteChoicePost(List<Integer> postNo) throws Exception;
	
	//파일 삭제
	public void deleteFile(int fileNo) throws Exception;
	
	//댓글 삭제
	public void deleteComment(int commentNo) throws Exception;
	
	//게시판 수정 (게시판, 권한, 옵션)
	public int updateBoard(Board board) throws Exception;
	public int updateAuthority(BoardAuthority boardAuthority) throws Exception;
	public int updateOption(BoardOption boardOption) throws Exception;
	
	//게시글 수정
	public int updatePost(Post post) throws Exception;
	
	//썸네일 삭제 = update null
	public int updateThombnail(Post post) throws Exception;
	
	//계층형 쿼리
	public int updatePostReply(Post post) throws Exception;

	//up순서변경
	public void updateUpAsc(Map<String, Object> map)throws Exception;	
	
	//down순서변경
	public void updateDownAsc(Map<String, Object> map)throws Exception;
	
	//조회수
	public int postViewCount(Post post) throws Exception;
	
	//다운로드수
	public int postFileCount(Post post) throws Exception;

	//dashboard에서 사용할 boardList
	public List<String> getBoardList();

	
	
}
