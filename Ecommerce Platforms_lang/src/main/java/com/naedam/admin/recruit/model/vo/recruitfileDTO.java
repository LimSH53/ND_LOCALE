package com.naedam.admin.recruit.model.vo;


import lombok.Data;

@Data
public class recruitfileDTO {
	
	private int fileNo;						//파일 번호
	private String fileName;				//파일 이름 
	private String filePath;				//파일 경로
	private recruitContentsDTO content;		//파일이 포함된 세부내용
}
