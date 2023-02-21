package com.naedam.admin.award.model.vo;

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
public class Award extends Comm{

	private static final long serialVersionUID = 1L;
	private int awardNo;
	private Date awardDate;
	private String content;
	private String imgUrl;	
	private String host;
	private int ROWNUM;
}
