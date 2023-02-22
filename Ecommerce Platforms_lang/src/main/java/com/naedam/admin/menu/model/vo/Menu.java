package com.naedam.admin.menu.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Menu implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	private int code; 
	private int category_code;
	private int revision_code;
	private String title; 
	private String content;
	private String url; 
	private String status; 	
	private String menuDate;
	private int menuAsc;
	private int originNo;
	private int ord;
	private String locale;
	
	
	
	
	
	
}
