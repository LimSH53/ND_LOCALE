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
public class BusinessContents implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int businessContentsNo;			
	private BusinessPost businessPost;
	private String businessContentsTitle; 	
	private String businessContentsContent;	
	private String image;
	private String inDtm;
	
	
	
	
}
