package com.naedam.admin.history.model.vo;

import java.util.Date;

import com.naedam.admin.common.Comm;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class History extends Comm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int historyNo;
	private Date historyDate;
	private String content;
	private String imgUrl;
	private int ROWNUM;


}
