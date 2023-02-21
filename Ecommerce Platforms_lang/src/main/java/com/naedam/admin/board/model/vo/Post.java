package com.naedam.admin.board.model.vo;

import java.io.Serializable;

import com.naedam.admin.common.Comm;
import com.naedam.admin.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Post implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int postNo;				//게시글번호
	private Board postBoard;		//board의 데이터
	private String postTitle;		//게시판종류제목
	private String postContents;	//게시판종류내용
	private String postDate;		//게시판종류작성일자
	private int postOriginNo;		//계층형 쿼리를 위한 postNo
	private int postAsc;			//순서변경
	private Member postMember;		//회원데이터
	private String postMemberName;
	private int rownum;
	private String locale;
	
}
