package com.naedam.admin.recruit.model.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class recruitDataDTO {
	
	private List<String> subTitle;
	private List<String> contents;
//	private List<MultipartFile> files;
	
}
