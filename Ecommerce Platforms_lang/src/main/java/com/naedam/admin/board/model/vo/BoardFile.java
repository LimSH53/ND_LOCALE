package com.naedam.admin.board.model.vo;

import java.io.Serializable;

import com.naedam.admin.business.model.vo.Business;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BoardFile implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int fileNo;			//파일 번호
	private Post filePost;		//post의 데이터
	private Business fileBusiness;
	private String fileName;	//파일 이름
	
}
