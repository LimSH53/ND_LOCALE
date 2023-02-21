package com.naedam.admin.business.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.naedam.admin.board.model.vo.BoardOption;
import com.naedam.admin.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Business implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int businessNo;			//business 테이블 primary 키
	private String businessTitle; 		//게시판 제목
	private Member businessMemberNo;	//회원 데이터
	private Date inDtm;
	private int count;
	
	
	
	
}
