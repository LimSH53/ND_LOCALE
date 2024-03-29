package com.naedam.admin.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.naedam.admin.board.model.vo.Board;
import com.naedam.admin.board.model.vo.BoardAuthority;
import com.naedam.admin.board.model.vo.BoardComment;
import com.naedam.admin.board.model.vo.BoardFile;
import com.naedam.admin.board.model.vo.BoardOption;
import com.naedam.admin.board.model.vo.BoardTranslate;
import com.naedam.admin.board.model.vo.Post;
import com.naedam.admin.member.model.vo.Member;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//게시판 등록
	@Override
	public void addBoard(Board board) throws Exception {
		sqlSession.insert("board.addBoard", board);
	}
	
	//게시글 등록
	@Override
	public int addPost(Post post) throws Exception {
		sqlSession.insert("board.addPost", post);
		sqlSession.update("board.updateAfPost", post);
		return 1;
	}
	
	//게시글 답변 등록
	@Override
	public int addAnswerPost(Post post) throws Exception {
		return sqlSession.insert("board.addAnswerPost", post);
	}

	//게시판 등록의 권한
	@Override
	public int addAuthority(BoardAuthority boardAuthority) throws Exception {
		return sqlSession.insert("board.addAuthority", boardAuthority);
	}
	
	//게시판 등록의 옵션
	@Override
	public int addOption(BoardOption boardOption) throws Exception {
		return sqlSession.insert("board.addOption", boardOption);
	}
	
	//게시판 등록의 번역
	@Override
	public int addTranslate(BoardTranslate boardTranslate) throws Exception {
		return sqlSession.insert("board.addTranslate", boardTranslate);
	}
	
	//게시글 파일 등록
	@Override
	public int addFile(BoardFile boardFile) throws Exception {
		return sqlSession.insert("board.addFile", boardFile);
	}
	
	//댓글 등록
	@Override
	public int addComment(BoardComment boardComment) throws Exception {
		return sqlSession.insert("board.addComment", boardComment);
	}
	
	//게시판 목록
	@Override
	public List<Board> getBoardList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("board.getBoardList", map);
	}
	
	//게시판의 수
	@Override
	public int getTotalCount(Map<String, Object> map) {
		return sqlSession.selectOne("board.getTotalCount", map);
	}
	
	//게시글의 수
	@Override
	public int getTotalCount2(Map<String, Object> map) {
		return sqlSession.selectOne("board.getTotalCount2", map);
	}
	
	//게시판 등록 글 수
	public int getTotalCount3(int boardNo) throws Exception {
		return sqlSession.selectOne("board.getTotalCount3", boardNo);
	}
	
	//게시글 목록
	@Override
	public List<Post> getPostList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("board.getPostList", map);
	}
	
	//사용자 게시글 목록
	@Override
	public List<Post> getUserPostList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("board.getUserPostList", map);
	}
	
	//메인페이지 공지사항 최신 3개 목록
	@Override
	public List<Post> getMainPostList() throws Exception {
		return sqlSession.selectList("board.getMainPostList");
	}		
	
	//게시글 이전 이후 데이터
	@Override
	public Post getPrevPost(Post post) throws Exception {
		System.out.println("데이터 체크 === "+post);
		return sqlSession.selectOne("board.getPrevPost", post);
	}
	
	//게시글 이전 이후 데이터
	@Override
	public Post getNextPost(Post post) throws Exception {
		return sqlSession.selectOne("board.getNextPost", post);
	}
	
	//댓글 목록
	@Override
	public List<BoardComment> getCommentList(int postNo) throws Exception {
		return sqlSession.selectList("board.getCommentList", postNo);
	}
	
	//header의 게시판 제목
	@Override
	public List<Board> getBoardTitle() {
		return sqlSession.selectList("board.getBoardTitle");
	}
	
	//게시판의 데이터
	@Override
	public Board getBoardData(int boardNo) throws Exception {
		return sqlSession.selectOne("board.getBoardData", boardNo);
	}
	
	//게시글의 데이터
	@Override
	public Post getPostData(int postNo) throws Exception {
		return sqlSession.selectOne("board.getPostData", postNo);
	}
	
	//게시판의 모든 데이터
	@Override
	public Board getBoardAllData(int boardNo) throws Exception {
		return sqlSession.selectOne("board.getBoardAllData", boardNo);
	}
	
	//회원의 데이터
	@Override
	public Member getMemberData(int memberNo) throws Exception {
		return sqlSession.selectOne("board.getMemberData", memberNo);
	}
	
	//게시글의 파일 데이터
	@Override
	public List<BoardFile> getPostFile(int postNo) throws Exception {
		return sqlSession.selectList("board.getPostFile", postNo);
	}
	
	//파일 데이터
	@Override
	public BoardFile getFileData(int fileNo) throws Exception {
		return sqlSession.selectOne("board.getFileData", fileNo);
	}

	
	//게시판 선택 산제
	@Override
	public void deleteChoiceBoard(List<Integer> boardNo) throws Exception {
		sqlSession.delete("board.deleteChoiceBoard", boardNo);
	}
	
	//게시글 선택 삭제
	@Override
	public void deleteChoicePost(List<Integer> postNo) throws Exception {
		sqlSession.delete("board.deleteChoicePost", postNo);
	}
	
	//파일 삭제
	@Override
	public void deleteFile(int fileNo) throws Exception {
		sqlSession.delete("board.deleteFile", fileNo);
	}
	
	//댓글 삭제
	@Override
	public void deleteComment(int commentNo) throws Exception {
		sqlSession.delete("board.deleteComment", commentNo);
	}
	
	//게시판 수정 (게시판, 권한, 옵션) 시작 //////////////////////////////
	@Override
	public int updateBoard(Board board) throws Exception {
		return sqlSession.update("board.updateBoard", board);
	}

	@Override
	public int updateAuthority(BoardAuthority boardAuthority) throws Exception {
		return sqlSession.update("board.updateAuthority", boardAuthority);
	}

	@Override
	public int updateOption(BoardOption boardOption) throws Exception {
		return sqlSession.update("board.updateOption", boardOption);
	}
	//게시판 수정 (게시판, 권한, 옵션) 종료 //////////////////////////////
	
	//게시글 수정
	@Override
	public int updatePost(Post post) throws Exception {
		return sqlSession.update("board.updatePost", post);
	}
	
	//게시글 조회수
	@Override
	public int postViewCount(Post post) throws Exception {
		return sqlSession.update("board.postViewCount" , post);
	}
	
	//다운로드수
	@Override
	public int postFileCount(Post post) throws Exception {
		return sqlSession.update("board.postFileCount", post);
	}
	
	//썸네일 삭제이지만 업데이트
	@Override
	public int updateThombnail(Post post) throws Exception {
		return sqlSession.update("board.updateThombnail", post);
	}
	
	//계층형 쿼리
	@Override
	public int updatePostReply(Post post) throws Exception {
		return sqlSession.update("board.updatePostReply", post);
	}

	//down순서변경
	public void updateDownAsc(Map<String, Object> map) throws Exception {
		sqlSession.update("board.updateDownAsc", map);
	}

	//up순서변경
	public void updateUpAsc(Map<String, Object> map) throws Exception {
		sqlSession.update("board.updateUpAsc", map);
	}

	@Override
	public List<String> getBoardList() {
		return sqlSession.selectList("board.getBoardList");
	}

	
}

